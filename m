Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F251E4AF
	for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 23:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716418903; cv=none; b=kiVOTIEkVdBB2fqfeUyPmbEOJhf7g2idVusr2Q6a8QI7tNH1dH1Bfn6YcBq8RvPFhUOxqcj6qK7q/2sjZFamfDRr2hrtOmWZV5IFPDnSL4gvEpsG4JbiQJkGuS0xKVDPiE/DToZYpU+Bxi98xGT72juTbwg+GPBvoGsWWxkWWxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716418903; c=relaxed/simple;
	bh=2S4UwANZHDCvcGjJ6kOp8Lq7CBUh0RxJBiNqIllq/lA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jH6sMfpgrF7nSs+XPsIoAO4amyParkt/MTVV+e9gzBqU18v44Wbtl8A+BCjT6M0KDnMvfxhXRzcyb6UtPzL5Gs/kCYSslB8RVXOAdmcAeHJnkqYUBpfuZJyECXSuWoPxHJvXfTlOcak/Gcdxk0BEXCBOEWZjHKXS27lkQ0I6n1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkOv7rHi; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkOv7rHi"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6f0e3667564so3143535a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 May 2024 16:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716418901; x=1717023701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuOISrKNUc5YSpf1n3iTvx1BpiFjgcJLUsrC21l2FZg=;
        b=WkOv7rHiw8dT7rMgqMl/gRtJXtmi9nR6yx/cPv/V5S4WUE6b8oCF6cfZUdTc7FiU1X
         LrMOWvxd+Q+RHZzgOAeg9yy6OCJ9rr2Mu/NFIR+Z9qqaBVparUMLR6YEOsfalr45gmG4
         uEHIzXa3yqMe4aInK+SIdvZ+xteH7ZdZhEvXIU8SvHCE+AbgynIJi0J2gZLEMGDoNCk/
         MxHRgI0Q3YC1e1YiijGTVWmtQk8ayEY7HGOF2NJnNSg1c92PPVtzTDj7YEo7wc+l6NZy
         IEt2LvV1H4NZ8Nn5E4oLHI+6htur81wVoesJ989U34ewK4fbBTFkDB9gJFN45vaZCmYS
         0iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716418901; x=1717023701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuOISrKNUc5YSpf1n3iTvx1BpiFjgcJLUsrC21l2FZg=;
        b=gCn+EP+1U6zFzBtzYxI3c1EQq2P97e0L5oXZrsQauBGtvYDH1jwtYgA+c9wpQMUIPx
         EiG6hkUWfXOPH09dr86ltxxTKKs1K46TBroERx1Y8/nlTzLwT9gcUEh/X17uF/vceLy6
         E2IY3pPaKCqdEdJXXinvNLSKhhSCpLF4/PPYGDv8QnNx4MiC29UWf0cNQXuMoPvhaiCH
         on4FlK0WW6XUC43XczPmzU54nKgY/qYPS1Vrgho9MVcT6fgZXWJqSNiVRwGLtUcf/pym
         nwO0VxnA/vdkbxlWrRe3fjqIMbao87mUrUZGv6qHWXGaJekLRH2Cd/vwhiqT+1G04XFU
         u25g==
X-Gm-Message-State: AOJu0YwiMGV4Oxxd7YrPD/VCnZ7/Av/I2quTajP5WA6HH8v50KJZzj6D
	LhyWwEdnGk0kcxa7Ucy+0cRvGaX9PM+l0h/kKVw4KxbnW+jHeeZRdlN5sA==
X-Google-Smtp-Source: AGHT+IHKH8RUcmcUS/pRwyHnuEDoFRBxr2XM//8lFtCVqbLCFRgxWFFFRteUww5UtB6vYheybsTg2g==
X-Received: by 2002:a9d:7a42:0:b0:6ee:3b91:5e3b with SMTP id 46e09a7af769-6f669819b4amr3614442a34.27.1716418900945;
        Wed, 22 May 2024 16:01:40 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0ff995ccdsm4155936a34.34.2024.05.22.16.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 16:01:40 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/4] arm64: dts: allwinner: Anbernic RG35XX: add AXP717 USB power
Date: Wed, 22 May 2024 18:01:32 -0500
Message-Id: <20240522230132.364915-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522230132.364915-1-macroalpha82@gmail.com>
References: <20240522230132.364915-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the necessary node for the USB power driver and bind it to the OTG
port.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index ee30584b6ad7..96a43d55baab 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -307,6 +307,10 @@ reg_cpusldo: cpusldo {
 				/* unused */
 			};
 		};
+
+		usb_power: usb-power {
+			compatible = "x-powers,axp717-usb-power-supply";
+		};
 	};
 };
 
@@ -323,5 +327,6 @@ &usbotg {
 };
 
 &usbphy {
+	usb0_vbus_power-supply = <&usb_power>;
 	status = "okay";
 };
-- 
2.34.1

