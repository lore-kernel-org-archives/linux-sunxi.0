Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110D29CE9;
	Sat, 25 Apr 2026 08:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777105233; cv=none; b=ZcnL8hjfpfQ8JTAFj7gATy8lZY5xhxzctc5/kpv39P7c5+1PLDIvWyGW0DGZ2JaexRdzy37a+2wbv1mD5afdu8qegeWT37ovcLU1I2BitFZZyK1WT33nCY0ttOCqg5J2WXUwjEO5CAD/PpTr07lYNKuzDO8hnNsij/CEO1yM5uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777105233; c=relaxed/simple;
	bh=6rULUYpY2mknKqA1TfHfaz2jSO4ja87Ku+5vnKG9jWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Kq+BAKtOB2CiGo+RIKpoXEoN0o/FrawclSphmM6fqeWO9b/UO2oK1HJowqanOOhEs/7729X2V/rld7AN8kRj9u3+atCz/oQc9C7sEATTCtiy0ffL5w3DOigf+eHv4InYfoAxLzuSk8RRNyRA6p4RYkphl/B6azrdogVWsTW9nU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=xoJLqkkQ; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="xoJLqkkQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=77H82kI7dEYyg2WwlnQ3ymitG+32GA2zsOuxHnqBHNM=; b=xoJLqkkQjuw3W/n8FeUBsU77vL
	F88vRCLY/lCbMZiq869VVSqh8QGAqngnES81nsgPQpWHUCPIqn/OIq9cqAJf9eJ6h1HJ++EqKi0ud
	9SMBhnHJnmSYjWfIoKi4qg/CV2GobjHzNRfDL24BTpT98FRkMvhTXAh1PzKkxwYNwub06sSJtqTdB
	M4DDi7jjRr4PxFzv6HJQ5q60URh1wmNR6Xo9T4wXedgps3P9sXdTbo/XsxeZ80OsLuPXzCpmTLvod
	Si9IpRf9vwiPIBOws6iboQEiYmElteeH5AM2yWxfEtqKZl3RoSgZGaq+fjPRfkYSw4CpifxVqH0aC
	Wo5u4wVw==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wGYFX-00000007jmm-0qEx;
	Sat, 25 Apr 2026 10:20:27 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 25 Apr 2026 10:19:40 +0200
Subject: [PATCH v2] arm: dts: allwinner: t113s: enable watchdog for reboot
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-t113-mangopi-reboot-hang-v2-1-fd343207a4be@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIABt57GkC/42NSw6CMBCGr0Jm7Zh2VCKuvIdhAWWQJpY2nYZIS
 O9u4QQuv/+5gXC0LPCoNoi8WLF+LkCnCszUzW9GOxQGUlSrqyZMWl/QFccHi5F77xPuQTRN1ww
 83omph1IPkUf7PaZfbeHJSvJxPZ4Wvat/jC4aNd6UIjN2NStjns4FWSWxk3P4QJtz/gHSh2fsx
 AAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777105189; l=1190;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=6rULUYpY2mknKqA1TfHfaz2jSO4ja87Ku+5vnKG9jWI=;
 b=gFFthnoA2sVKwhTKhyPGfugGxsXISbKliHdFH1o+xU1MVWeBVxcu2MPV746gFWvtHprV6qACR
 wIFXFnYNdZlDWfNbj4RKdyHhwGSKf5kf2fFaEAXHmGMmawX8YxRyNfW
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl

Reboot hangs on T113s boards because no restart handler is
available.

Enable the SoC watchdog whose driver registers a restart handler.

Tested on MangoPi MQ-R T113s.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Changes in v2:
- Moved watchdog enablement to SoC level dts following Jernej's
  suggestion
- Link to v1: https://lore.kernel.org/r/20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl
---
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index 424f4a2487e2..d3bbed84eedb 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -34,6 +34,12 @@ cpu1: cpu@1 {
 		};
 	};
 
+	soc {
+		wdt {
+			status = "okay";
+		};
+	};
+
 	gic: interrupt-controller@1c81000 {
 		compatible = "arm,gic-400";
 		reg = <0x03021000 0x1000>,

---
base-commit: 27d128c1cff64c3b8012cc56dd5a1391bb4f1821
change-id: 20260412-t113-mangopi-reboot-hang-c9a9def82e2b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>

