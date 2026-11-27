Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764839;
	b=kO1vMGCkRkByd75VZ6dbq3tQ4K53tOdZ4ncZOthOQ0bsrR0SQ5VoJovyvOHVhXeuVJuN
	 NG0MG64Rga1e1DL3R1gv6oUq6L9bQjzj+avhbMlyDzASGXGYleSgWUGCEulnsON7QxAZ+
	 pYjnMM1FnC0/GQd6qN3TLz/5m9mQMxrHTgPqxIray8fX0f75/qPANWAcS8r5NdAhpkVar
	 mLRyU08Cwj7X52VhgJLmKQG1cFNs3UKg+YmZ+yK0BQZLX7QsebfOSgu7RFUxQrKMlD81Y
	 Br6RUjfLFJqQjPr+g2POdmvhlior0eTQjZX/xuzv5/9NfQJQ3YiFNbbe4ZQowYRInjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764839;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uICpPy46156Qop/jp3ZmypF9lqZQuvSym7JHzzWuGSk=;
	b=s9KqG2ckkp7oHU/iT7TQz4LKEyIaCXDSetM4baDX0CMaoPtTvliglwXMn1mC3vVcLJIY
	 fvuYD8UWGRsq1eSqHTXaZwg3M2hetAoIHlbQDm0yJ/WGcNxg6PdM6ELLjTBKRkfmTvgPX
	 Knruex/mKkk/t22HEd7R3BfDFzgi3IEv/f2lAtRRUdfUR1ILQW000AzWRT4ws+8jLuIBG
	 wShsqsvISOS0ZvoQv9Fjx1SD22vfXdz/QyaHxFK9xzSIf2ZtLl47el30HSuaVbaBYiPPK
	 tACOvkbMIszc35HDh9bP8t2iDBkF0kZpH9Y+DwRQIM3+sJNvEtqLuxVigyxAz21OIgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=xFrXOg7X;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BC1606A321
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 07:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=xFrXOg7X
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id A17C64C968;
	Fri, 27 Nov 2026 18:33:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uICpPy46156Qop/jp3ZmypF9lqZQuvSym7JHzzWuGSk=;
	b=xFrXOg7XFV5pfjadYpUmmqSCviTxRZjgootD8kxfuAITcYPsVDbcWTe3Z3ksj+YIh6Bzij
	h4tUcN/L71K/BVlFhXl2FfCg/Vjmhdh7+Ke9J6igrFPJNm+gjLH6pQONwB9W2H4/uu/c8U
	Caavbq4sNx8FXkbWntruQzYOlVUaQ861RwSGcXQsT7Or1ZSJUV75CFLX/G4ZYluG5ZA4Q1
	jBPtY4wjZKHJrU/Y3TZzGbBP/32a9o0diGK1csNgGfxIt3o0lvf9X2IxYUT3RF2klGM6E7
	1Estur7p+Nz8ru/2pZ9/o9A2B0VvTjJlUm5QpcpIFM91B0LYmLcvHlUSduD25Q==
X-GPT-Reason: legitimate; this is a technical patch submission
	(likely for a Linux kernel or firmware project) that perfectly
	aligns with the personal/professional mailbox of the recipient
	(alastair@d-silva.org) and the sender (alastair@d-silva.org); the
	From domain matches the recipient domain, there are no external
	links or phishing tactics, and the content is specific, technical,
	and non-promotional.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 11/11] arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable USB 3.0
Date: Fri, 27 Nov 2026 18:32:31 +1100
Message-ID: <20261127073231.1776847-12-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable dwc3, u2phy, combophy0, and VBUS regulator on Orange Pi 4 Pro.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
index 374287d962a8..0e66e4761454 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -21,6 +21,33 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_serdes1v8: regulator-serdes1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "serdes1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpios = <&pio 1 7 GPIO_ACTIVE_LOW>; /* PB7 */
+	};
+};
+
+&combophy0 {
+	phy-supply = <&reg_serdes1v8>;
+	status = "okay";
+};
+
+&dwc3 {
+	vbus-supply = <&reg_usb1_vbus>;
+	dr_mode = "host";
+	status = "okay";
 };
 
 &hosc {
@@ -68,6 +95,10 @@ reg_dldo1: dldo1 {
 	};
 };
 
+&u2phy {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.53.0

