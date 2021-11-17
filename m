Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5532C82
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Nov 2021 09:47:09 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id z5so8358218edd.3
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Nov 2021 01:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ipfWcDKpQnO9TzUX3IJ9sYDRn+G7NMWRbyuYTyM1Soc=;
        b=hwSjoLKjrDMCeXJP3PGpaqN0SSB3cVtOgm3pYZZ0McgfqtfU4A0Y3IZuYPzmjon3B5
         QS4MXd0hEUdvn2VTohy4NisEY/+EGjDTl7ENlHjoCF1uwn+e1im4ThXzef+9C9Ne0yAD
         8Daz10tfFy6H+YQqIcfe8X0aHv07WQb1akAtwtQdNyJawQqgo7WMU9Zlb+q4Y9PbWRaA
         pk34Zc5LDMtIiVHpiUUudbOqzSJq43A8YFclnGHhPGReWAjX3l8j1/Niq1N+8dAX8eCP
         RO1OGq8472cHtWq5dEIY9YxdJeM2/HWzFRyulize3hVuLiZPFpoWkTz9WlH2rWaGxzXv
         F4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ipfWcDKpQnO9TzUX3IJ9sYDRn+G7NMWRbyuYTyM1Soc=;
        b=vEEa5NQ73iTdCpZ2urczFo6MdgucJmt8t94vxsODPwhGuHStg8kLpm1AtLDRgWWYcw
         POw37V5GRI/ZVQK7rvuL5xA0psf5xcG9uDU34gIgayKkNwawyAC/mzFAg52dMsB2CQ8i
         Fc8t76A4HOZphlhmJrqsU9b+sWpPsaG6g03s34qNzmJQI95Qj0bSDT/D9gbpKO4daxjY
         BYzwUXhic6KtCqTYlnWTo6tk8DQWXRRTYQvGf0wj1e5IhDOEizh6auNI5vf+0wL4dYx1
         UxWivFDgOgIaGK398ao/276jlav9trpXPgm7BrcdjV47OMgA5sQoHbcXooi7IUaJYtl4
         0Ufg==
X-Gm-Message-State: AOAM533E02hh72LE9l6ZGRfcKCm2PcWGo5xiWm+JLjwHS94P4PR+LoPW
	jpM/oLc83xyYHB+4fPOzLNlNDA==
X-Google-Smtp-Source: ABdhPJw3EizNegAkM0uu4+BjBSPlXAu6CGRHAL5Q829i5ghg4gHB6e0Y1DZ6yJIfL5+Qk4zl1JBUNQ==
X-Received: by 2002:a50:da42:: with SMTP id a2mr19290119edk.361.1637142428126;
        Wed, 17 Nov 2021 01:47:08 -0800 (PST)
Received: from fedora.. (dh207-98-180.xnet.hr. [88.207.98.180])
        by smtp.googlemail.com with ESMTPSA id jy28sm4891820ejc.118.2021.11.17.01.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 01:47:07 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh+dt@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Robert Marko <robert.marko@sartura.hr>,
	Ron Goossens <rgoossens@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: orangepi-zero-plus: fix PHY mode
Date: Wed, 17 Nov 2021 10:47:01 +0100
Message-Id: <20211117094701.11974-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Orange Pi Zero Plus uses a Realtek RTL8211E RGMII Gigabit PHY, but its
currently set to plain RGMII mode meaning that it doesn't introduce
delays.

With this setup, TX packets are completely lost and changing the mode to
RGMII-ID so the PHY will add delays internally fixes the issue.

Tested-by: Ron Goossens <rgoossens@gmail.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
index d13980ed7a79..7ec5ac850a0d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts
@@ -69,7 +69,7 @@ &emac {
 	pinctrl-0 = <&emac_rgmii_pins>;
 	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	status = "okay";
 };
 
-- 
2.33.1

