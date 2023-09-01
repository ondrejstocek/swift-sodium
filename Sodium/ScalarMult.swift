import Foundation
import Clibsodium

public struct ScalarMult {
    public let ScalarBytes = Int(crypto_scalarmult_scalarbytes())
}

extension ScalarMult {
    public func base(secretKey: Bytes) -> Bytes? {
        var output = Bytes(count: ScalarBytes)

        guard .SUCCESS == crypto_scalarmult_base(
            &output,
            secretKey
        ).exitCode else { return nil }

        return output
    }

    public func mult(publicKey: Bytes, secretKey: Bytes) -> Bytes? {
        var output = Bytes(count: ScalarBytes)

        guard .SUCCESS == crypto_scalarmult(
            &output,
            secretKey,
            publicKey
        ).exitCode else { return nil }

        return output
    }
}
