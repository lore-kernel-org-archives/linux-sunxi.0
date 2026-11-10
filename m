Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280405;
	b=TAusfMiFskfjyJf/DKgMYgcFBYa9SQw7QiMNzz4Bu02rVRgWLc0uo23e5zmq72ai5WSo
	 VX/vd9NFu23L/hjRZWm1+XVYD797lyIgvbpmSQlJt/sE/vFmYKzkiV5vBCJt/FzE0ZPjL
	 LPJMopJRy07YV7uF9TQx0s9BJtW58/6jUkII1HIzDs22j+7UEErhtfnuH8AXCRuNz/m2l
	 fiX6lrYWUnGvD7bm645hj860jaFxuaObikEfjp3AqozpylgmNoaWor5AdDbGMFt9zcN2f
	 F3cqBfEe3kYP0Gte9iRcyMJooHTCChJHp7pSwQofuW70hCmYzo23sx6jydBa460/TpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
	b=y6uNNlU2B2vgG2FFaXU41X6M//iLbEGuzSb6iTbNcvwN+NKMPkxoOfFMd+wZxlQ3SyVi
	 0ujWyQgyW0232vrfXdbfIepDHgBDH0Gu0dfE4KIQjUlA1tiHWf0DGEGjMPncL1GsJPQDr
	 n9VeEQWmX7omGD7Pv2K2fPvawczLy/1R9V/yQ9h6fNXYzSFyvoGE6LizpL2gzdP2Cj1bj
	 DnH9JweBYa2u+PAObmNgItqmlh39Wmvf8f/+nze+QVaXqzFd6hD4O9fs7Tcw9NprvSgZU
	 q+woHSoiEO77AxdnXYOSHiVeBH5Z6u4tFhtU7o8NrWFHd3NF3Id0X/9FR1m88yDpBRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOidOEmW;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C222960A5BD4
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C222960A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOidOEmW
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-5326cdde017so479992b6e.2
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280404; x=1794885204; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=yOidOEmWNuXXJl54/ACA4erFzRCFlftOqX6qlq4LsM9AV63UHDlfvwD+VtnV9A5lvk
         OJZk4wW43gAaur538xETwnPb3tQ6aPHKXQ44p2oKh3fLoSyTRMEuhW2nDj9Ai6WKB9Li
         eDe6TIDqOrSWOOwelTn+zfNq2KS46w/TIwfRUI946F2KPwjD1A6kfldlpG/dLa5x3q3N
         /NSt68hB/EVmgITPe2trF7UE1uvoWAloO8fIUAeCFsonstqGFntfw/Zhu5nlfULXvwy9
         0QUHoLkFlYwj6h+vfR14CKzakHPyn8LmxWDm1mwiQNMUxycREvyueMBci1+O0heAEdRC
         Au5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280404; x=1794885204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsGYkHSaF8D1INVVG7IqcJD0MRHplG6cSUzvau3umEk=;
        b=QaLPuOYehBBkRviUPgNSLUZ65jIWbvB4MaUwHgysZVwZBrxhI/5KQm8gZ+G6u/bkMk
         ih90NOAv9dAVKyXpXhHOw47YeBhNekRYTmVOlYkF1OPBh1n9urnqmCVa2T7TeemybdeT
         3idMSLT/bkM6i2QXIhOVDAtGdlPaWVdFPCraJmYrfGjHEzPNR6hi1RkN/IsYgb3DT0LS
         RdSH/aUIBaV2EUICnc2o848uHQjgRgO7u2NNvgzmhoAs8uvtSMs6O25NX8Xe/+pETpzS
         B+tWCtX6Y7k2iTWPcsVnj1rIjT6YOeCJSN+ACAwK4EXipsUlj0sY4jYMXUcgutyo5MLE
         RwWQ==
X-Forwarded-Encrypted: i=1; AL+hErHJTU5wAUlTMuW+BvO2NHGubaaMQP5mMR1rcZnmexq51/Smk/CopNfETIvNFbLdvZ0q8ivE5zibmvcUWQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8qXC/tzEYmLl9PRQzgUeV68itaLA4x9wEx9NdtNEITYhkgsPQt
	XE5K6rytkMm+HtFGqTmbNgwr0eeP6ROYGppy3LtnOEwdL1mvG33ddoIb
X-Gm-Gg: AYBFou362UhLxLD/UcnryK8mBkjJID+mKq3REDAFGdRpyX9rZr7VoKdLDOP/K2qRKkI
	FppfEEkXJWRwr3FTxTVJam4Y7/dd0LEJ1LPvs+AdN7FKExv8pJP0rN1ySKLvLCxlU67MadAlvSX
	OZ5B9Lq1ozmpjEIuBfCO4/Np0VK/MK5DfcflR8aloW0vESp2y7BNb2UtVldxiES3IrtyrjgYYxA
	8dyoJdpDyUG/Abs/qa/dVXSFFXOQVd50Acp84GEU+heSAtAkTIL6wkmUkAGdboJDO5nIvtKD1xp
	drzkwaio0jqcM+da2Ld8FnCyYM8Oi4u7JAxPmyKequjiLXLeVqPQ3l+wpt9fDGrXXtPvC9pAn0e
	6tWINVH6b/6ABeXlzFFa5CHlfDUME2nrNqLrqr9fsv+GJBl+7bElInafMJRCSv1XGvxlk2edRQ1
	rVqOI34ETF6KixczLCmaqw+CElMboIim6c1/WucwmBUn4rVxtjE8FITMKCiCZL+3NEBXK0XAL3s
	xus5KZ9pq1DRJmfiL4v4e5XJveUnOGDmL30vYbYBz3QcBCgDTDj1Ensa3wX/VZmezisIyhF3jez
	prTRw6i3fgrsuCpemMRtFWlzdFtMoAaAXCGTJSb7PDcXWu+JXWfodOr2A9IJwMxCuGEmQcHkl0l
	dlTWlB/lX3B1mRnDSO3gNaUIQmSA+8jVAJshyPjwJBHLgNkmHAwhbSW5jfXPXuBmBf2YFO8uGQl
	IKyelL8vbJ8IsZW7+XzPa4sayOhEKPB8k9Yudw9LsifiIKs8qMuPYj
X-Received: by 2002:a05:6808:509f:b0:55c:8ee:a9c4 with SMTP id 5614622812f47-5683cd30aacmr1359211b6e.43.1794280403760;
        Mon, 09 Nov 2026 19:13:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:58 -0700
Subject: [PATCH v9 09/11] dt-bindings: serial: snps-dw-apb-uart: add
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-9-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
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

