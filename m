Received: from m101-out-mua-6.websupport.se (m101-out-mua-6.websupport.se [109.235.175.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CF717D6
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.235.175.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784431328; cv=none; b=WtUO+GrnsiXpxnZA4/uc5fGAIUOw4QwkRf8kpZf6U1Zp9piOnErQmPRB+jjLj/BBDBM+chPVjO4CL9Wyg6e4HlCyEDhKeY1TLwubJKlteWgvH+6MF6+QrFpYZXuhd87u9vx96l9tWyqpCywc3NxsUa01pEAQi0byjCIZ8sAnjVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784431328; c=relaxed/simple;
	bh=WVXEC0eSoIiTTE5CMN7Ph47NUzZFvooh7e4De5/Vq1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jiq5+UpibdENpLDt/RbT3OZpMoRaCpCSK/5LOWDLp/xxiCcBwL0/WYinNRkv6JmJZ8yrIsUAItAKIebxdLNCcHFOTGYqE9Yx4B9fcXBu74TfC9ih/YRQya3hvVcuIGTnqwyV0dB4dZkuXJusD0ysgneLgkQr7BI9Ip2BnbrU3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se; spf=pass smtp.mailfrom=palvencia.se; dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b=PId/MM28; arc=none smtp.client-ip=109.235.175.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=palvencia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=palvencia.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=palvencia.se header.i=@palvencia.se header.b="PId/MM28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1784430611;
	bh=SMetgcZ2RVSRdUKhAuqyb+tQgU5bfkA+NRCyaa9S9ME=;
	h=From:To:Cc:Subject:Date:From;
	b=PId/MM28j35HDNy26lo+Ib4JZhpuMWMOx1rcckCKZfysBYnrDFcYMGurn8vUT8VMr
	 cHgL5z/ZH23FFLXIKbCNZZcXyVYkB4tQrW8+DmnQZ2Dug1hB5bv54SN7MF4NWWeZG4
	 Y5kkI+PpIg9qen51Q2AccT4J7fWq0p3waqScNgk/w3KZdzsNBys2Lbsdw3TGwYdIzc
	 Zn16aazUCZokQwTAW4vS2sJRmbIw86GY1LSCtF93ywMlBYt12tToTkhSm1b5S8ZJV6
	 cLCbGDIoeVz5Vjf0VZuLe8fOKKH6nr7m5nIoe3rt1qbEi+eHzITYl/mG6muewIPKNI
	 H9rSeP1IQBcUA==
Received: from m101-u6-ing.websupport.se (unknown [10.30.6.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4h2pYH1xbBz1l7Q;
	Sun, 19 Jul 2026 05:10:11 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u6-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from palvencia.se (unknown [193.180.91.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u6-ing.websupport.se (Postfix) with ESMTPSA id 4h2pYF46KFz2yPs;
	Sun, 19 Jul 2026 05:10:09 +0200 (CEST)
From: Per Larsson <per@palvencia.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Per Larsson <per@palvencia.se>
Subject: [PATCH RFC] arm64: dts: allwinner: a523: Add SPDIF to x96qproplus device
Date: Sun, 19 Jul 2026 05:09:16 +0200
Message-ID: <20260719030927.2417-1-per@palvencia.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Out-Rspamd-Queue-Id: 4h2pYF46KFz2yPs
X-Out-Rspamd-Server: m101-rspamd-out-5
X-Out-Spamd-Result: default: False [2.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	HAS_X_AS(0.00)[];
	BAYES_SPAM(0.00)[85.14%];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	LOCAL_OUTBOUND(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 2639
X-purgate-ID: 155908::1784430611-3BF041C6-785FE4C3/0/0

When spdif support was added for the Allwinner A523 family of SoCs, only
two of the three possible pins were added to the dtsi, since the third 
would clash with the first ethernet port (emac0)
However, some devices don't use emac0 and instead use emac1 for the only
available ethernet port, leaving the pin free to use for spdif.

Add it to the dtsi, and to such a device where this pin is used for spdif

Signed-off-by: Per Larsson <per@palvencia.se>
---
Marking this as RFC for a few reasons
1. This is my first submission, hoping everything is properly organized.
2. My testing setup is not the best: I get sound with this patch, but
   the pulseaudio daemon needs to be restarted far too often. 
   Hopefully it's just something on this minirootfs. Testing welcome.
3. Not sure where to get the hash for a fixes tag or if that's even OK

---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  7 ++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 24 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..7370e8ed24ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -216,6 +216,13 @@ spdif_out_pb_pin: spdif-pb-pin {
 				allwinner,pinmux = <2>;
 			};
 
+			/omit-if-no-ref/
+			spdif_out_ph_pin: spdif-ph-pin {
+				pins = "PH7";
+				function = "spdif";
+				allwinner,pinmux = <4>;
+			};
+
 			/omit-if-no-ref/
 			spdif_out_pi_pin: spdif-pi-pin {
 				pins = "PI10";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..b172985583f8 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -44,6 +44,24 @@ reg_vcc3v3: vcc3v3 {
 		vin-supply = <&reg_vcc5v>;
 		regulator-always-on;
 	};
+
+	sound-spdif {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "spdif-out";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_out>;
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
 };
 
 &ehci0 {
@@ -275,6 +293,12 @@ &r_pio {
 	vcc-pm-supply = <&reg_aldo3>;
 };
 
+&spdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spdif_out_ph_pin>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.48.1

