Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A973034751E
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 22:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537922; cv=none; b=hph6ZkjNtXv6xhSqujXB63+c4uerceUGE4j09uzEKjwpSl2Nv3xnlrEBQ3eTMnunW+HlEkc0nmy5x6LcOM07UPMFTsHjZ3vq1zeS3kd48U77PlwlPUrqmueBOH1o8/WwwEd3+3jlYaVMgj6P/cyPJLTf64iM0IbFDNpWRcO73Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537922; c=relaxed/simple;
	bh=gw78jt7vc7Qe2unAjmzAV6lSueBAGQ5VKMrWZ7C8lG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnZ2ETQs9Uswet3fxR9HJj4P17M+KPAgFmdlMLJrV4/sYa+Ye934j3gL0PnfTUP/gLe2rJIzQUZ/cLntgVOMvslOOFvSrpafNu4210MPNy/GW37p0PFvJX+fO4G4RuT1XujsYsvs+Jq16JVM+R223Fcv1onqfjRJBELRc0s5d8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZHuzlzpa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZHuzlzpa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69CA115A1;
	Mon, 11 May 2026 15:18:33 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2B853F836;
	Mon, 11 May 2026 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778537918; bh=gw78jt7vc7Qe2unAjmzAV6lSueBAGQ5VKMrWZ7C8lG8=;
	h=From:To:Cc:Subject:Date:From;
	b=ZHuzlzpa/q2kYfPKIy3ZK9p/GeP+9iBl0ufa0na+6i8CPLsnnCsb+sFY9252b8yPk
	 rPs0EgKdA3Uzdv7xvn/jNqbEMyIfFZpUAFMxj4jK87SFhYj9w5Dh5K8GZ7wfu9lc4F
	 ERwrvw4vxpKpZU6DKQUHGhKM+bidYmJZtMPvxlQQ=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
Date: Tue, 12 May 2026 00:17:41 +0200
Message-ID: <20260511221741.25888-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Cubie A5E board comes with 16MiB of SPI NOR flash.

Enable the SPI0 DT node and describe the configuration.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index bfdf1728cd14b..7ad22fc85d1fd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -344,6 +344,21 @@ &r_pio {
 	vcc-pm-supply = <&reg_aldo3>;
 };
 
+&spi0  {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pc_pins>, <&spi0_cs0_pc_pin>,
+		    <&spi0_hold_pc_pin>, <&spi0_wp_pc_pin>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "winbond,w25q128", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.46.4

