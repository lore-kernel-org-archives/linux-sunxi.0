Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742016;
	b=nToCvIXpIvl2wZrnwwceh9d0uv5vCfro5Ur85fAPT9vKXXAatjTID23NldhOiF9sduBn
	 /y2nHfIOc2LQoeOCIvbFVRNXZ7bYcezNbRgFgS2Ztfb0wFbtUdTrrHkbCB3iJrVUzy40v
	 V95pcp6GLg06qowPw+eUnWLG+/9RRUSLgR0VvtXiJ0LnWYafcKFrmP627/f6vT4zcTxbl
	 jGiAgmaGPLanijfrCWvBl7fviv5+6kKuZNbylpLHb7rnvpwE3VGTin++BWOT8jExwrx3+
	 8TsPaSv6BFFp31cbZnGHGkPcZYJvIkzVPOXLcyLH8ycDZFL5keWeVuQb6GcowzmLuRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
	b=jIeo4jI4tKMYBEQgTITN8vKxDdosNJ7zwqjcd1AJ0XPe7VeBfcFSl9mjd+jHUHcus01G
	 zxfxIQVp0oqHJ9o/72QQ4MTGRaT0RlA3CtdbtWDr5UIR12PA6O1sPHeApmGE5v/4CSsGS
	 A0H6ZAMlCZlE+nh0WRfB7oZ6RFzmDd08F6jdtC8y1GIRSvbjfSc8aH0H+0k24V3NEzx7Z
	 MIB4tNZoIGG3gau3VvLDR89yzzaqSjM2gISIZOyGKa+Cn2HMMQ8/Z3mf245w3Gqq8srtQ
	 WNw0vBUHOYhU+QuzPv8k8LZFSKHXuNCQ5HnQNfA6g8GX3+gfD7LCHs1OFzAsRx/+B2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JuvrfX25;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F27606A33B
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F27606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JuvrfX25
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-483a66818edso71968fac.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742014; x=1794346814; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=JuvrfX252/MS5nwiIqY9iW7FG3Lyi7W/gULk+ejqxE2gYm8dlxS+XSjVtCjclgT0k5
         tAmPID1OW2M0L7kJpPlLQwCZEzSFp7XDc3QPWkZY8CRu6GlV5A/lcglpPgtsbF+4gKwf
         rcCju6uJv2R4vIRn/p/+V+7A8LQI7XvSMjdkgH/4WpKyO7IYTL4hGSI+oABbXaHCcPKZ
         Ip+diT5bmAYY4eo5Dm6SboT7nDOkuYzNkETuSRq03oCNgCuarFTESLrfPw2ID/4BgFcx
         7mm2Bd/MoIOVBv40ysguD2YLMP3rzbV/sqCNhj918/dHEfwIgNxbj3U186j96mFOnIz+
         qrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742014; x=1794346814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=qpdo/pa9ih+Tlh4QvEuRh5lcSLYm2Y7sDCCwHXZMmMubQufxG/trPTCLLJ8f6jsBlc
         LEKB5bg8ezspRI7RiEIwWOknHO351EzITusPbl62SxCA7qLsG6zRbVy7Sx4KM8DjemT2
         wvq4ro/tarZ74zxldQ6UCybDytXt8wAtuxYoUezj7V2TYf1Xe4+YMfQMe0awPsIAdbZG
         HbCkYQyHU5V2fcPsyzZt5UYCPtTmHYYrk+QZX/CIJHIHxGwZW2IjYfv2es0I9GzWAM6E
         YTbxSHur1AqnqaYh1mkcnnFD/9plJZvyOZSC3Xe4S9m/9typQGeImdDrpyWk1Pg6JRKL
         ilew==
X-Forwarded-Encrypted: i=1; AKwUvByqNYcNzuYmeZ8jY4SEhlyCzzysGRwIv3C6FvxQquqirdUkEjvnN9szcoZ7II0/xRMr9OBZ1crc4H/DbQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/yAOWbx2uClB0DvXn2PyopXh8QXtwdL+zdsJ4TuKgixV/nVHWM
	Qzd7ZAny0PoNCAFLpvcaVoE1iyLDlm3X5s1WNIYkSPCDLA892ONfy2Fs
X-Gm-Gg: AYBFou2W0mEsJ8HsNApus+4xgvFVFyq/QXSgSMS4N89mTqi/Acnd0RgPAQgyKc8Q+f+
	JFs2OATEDvFTUt9KVSxRh2sjt6VeS1pabNQHHZUmUWm/Av+84YIQt+lGa7jmFB10cy6yodYftv0
	tO3hZxI0dqmP15yiwKiimyox8Tup3jyBZZAws9tOqqERKkH6h7bJZj+29QK+JIrOP5OXr2lhjfn
	dZ5QH7gb6tYuI9oCqHCkR2AMQf1On6iIscoEkVwq6kNbDuiENQ24dzYIu2sWYtAekTF/Obebat7
	IGObmNigaUMLfG1pVex5anHm34eATOCrjH8m82vOy/q9UOSdMYziRb/0jlubsX/mJlYoTDuW+ni
	+GzxuG4qJrBgA7D9NO+44MfpIy0Yi6HS2/GEbnCgerdNo3PT6LZNPRBdGpSBj8ccklQgWLQKkOn
	ypLT3MZ/AZCf4kZ3znuA6RpRqTpQ/1ovSv8SoZvBuHNvpMdUXLMZOhc/gP2e3Pju062EWSRgKm/
	xdhQus4rx2YjaB8t1pXkdfjqZ63d4uok9Xu7JCoq22MSu/S2m5X8dienYuXWpBEQ47+guCmBs3f
	Osl39jioTQsis9WuJ+tbJTOJCJi4ttSJrZIgfIUnr8XQqL+z9A4fvfB8LJqMimMnSAFJsMmsKdc
	/mVKU8cz/fIQ8BUC1fUqgVKHqTs4QXdBWKK9txUm1L+EFLXWQRnbO2FRDbJkBcSCGg3nmV8xEJj
	A5expU/vTvre5ZqE3ciuOcq2S/7xZLpWs2ekfx1Pdr2/Sxb68dTTuW
X-Received: by 2002:a05:6808:148c:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5640dddd764mr9603574b6e.36.1793742014606;
        Tue, 03 Nov 2026 13:40:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:02 -0700
Subject: [PATCH v7 09/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-9-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
The receive thresholds follow the standard DesignWare FIFO-relative
mapping, while the optional-register layout differs from the generic
DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

