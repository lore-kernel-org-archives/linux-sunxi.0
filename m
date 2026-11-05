Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911947;
	b=fOmdvHXAeXrEjiH63VKllUUTRM7XqEd0bq/5V7qWzSAqoXRrGYhQX1lUryYXrfnfrJ3t
	 QHlVc8+DhlW0L6F3a4PFvu/WhyvUqBaPS3jFIBVIz7xjfgFiRXwbyiBNLdsZZq9pzYHYB
	 V8DUkrcje1tCsxoHLD/JuwHf6SSU8pnBZWGaaczOXu87cc7CqIcbuwDEw6IZNKVU+1oAV
	 xT9riA6pKnaX5uGKxo8VM2TokVKP9+Gc+LcbvkcaNgnOlQmH/YFHAG3rDxyim7NmV2WwD
	 FL7QyoYk4gWHVvLfj+9Tih3LN9JEISZSuO/MwMoQjJ9bjfuYJFKp2guNGKg03YI91DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
	b=1CgUfzQ4KmhvhSzl+FS0R9Lex+t2YA++403VUnJiwtpOZ4p3LzOm2ub56ZdrjHZhxzua
	 kkhIJ62MksrOpK/SFBbGAMMXfc/hwoPEqIhF+iMJ/gf7w8C1rP4e0aJ1IO8xAlJNUtuo/
	 RO02LThzBdt4LtTaKvm2Go24ldmI4FBH0XMkNe36TGsFkHcPol15zQezavG3HtlsRhVUg
	 3gTv/W8liA2HxsZwXQOyNxRNtoiwSIF81ESOxhA+JL7nvCVUr3a1yo/H1tXiLXlYiACGc
	 /N4Zim2eMs2sJcdkRAj7q2v/FNEHGVNcVeHzv0wh5tVIBBMh/Eu0+F2iZzYA60rB1MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pCxRosQq;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E66606EE80
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E66606EE80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pCxRosQq
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84e513877a3so1087383a34.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911946; x=1794516746; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=pCxRosQqW4q4XDnP3VWeU1rB8laRpeM9I/vOqsmwAyFQbGnY5mpiPC8H2zvkSuDv0x
         YI2bTOIjjNv7hY5iyuTIgOkPryABH11NX+R7/NMtvjscPgeg4hIB8bV9O+Xag21FfD26
         4mCThxJfrDAzk9YPfzGlmIdOnPda541ztbbLePkcrq0PFmYRugVgV9xRiXw2i49/Ffkc
         iJRdB8WlR7Bvq+l4ivhVTX8RrXqbQVAs84bNNWoaC/hEHtgyrmwOeAy7PeqxWryXhILy
         Kjx1qci03+wCFXs6hk5ZAJDleQTv/xzSiNfeT05tLySs5Y8ZaUT96b+1LrnN3QtYQGkm
         jVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911946; x=1794516746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRoIIA2wpujQ0+Dd3LKXeU40GCpk4ukouOoolwO0ux0=;
        b=Xk+fgv8rYTTSZlYv4a1ahXV3cL71IImv5+7GmYqA1mctVQMi4fPKcaW+F/r42Cd11q
         c7CFDc2uof+r8FyHgcrwzmoT+k/nHNCJevUG/lYaWvSpjilV/9tGUZNPm/nwoxZDG3Wb
         6Y6cFTxU3wb0W94tKqhoSFzPJzf5dH/DC34tUzp6/HkGbRWc1YLPPudJQYnwIp5P8N8B
         7FUmld8wvHlaPcu0EnTngURIfW52yTpjr0lY2zAuFAPLssXDzMCepxLocEKrduvDrih+
         oIcTfXeKite1BFPkhZcxYztMUxnM3P0c3FF+tm18EpDsOR+h0kZ1c0MdVBlWl72dK9Pq
         blfw==
X-Forwarded-Encrypted: i=1; AKwUvBx4As92iU7PX3c/wCy/9hWfHRoIIqpLdooGXxBdl/BCZyMl5lVuM8YgLaOXCIiadmUZyLyQ9j/QJpheZw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+a6xkRKTAsF+pY2iW5GJWF1bN9JkKStkra+FzwY2g9yXRI5XOZ
	QtOLq0TLutltcLgNbavtr2LyfKnSeQkAIgCfME5b5UuFno+NF137jyuI
X-Gm-Gg: AYBFou20paCsOEOvanicd81fdsAyCWbBX8p0NdI7WlXmfZ5UyIxsvnEld52zDotO+9d
	PHifC2r7zVQ3D4hiGCqLirOfNwAiDfGbXimFtuWWSbHxQXeBkqtvFZY3Pqs+rTybbuVAtyXOehv
	nQGc2Xk+CSE+B6w1Uxxrl89LPI1eTXtC2n34FJrc7L8Nh1mrA6Q3JFi2KF2uvoI6enOb+9qOjsG
	B6yfMgJ/1aZwL8tQLHO7zbSWrQeidL7+bJ2V3eMVbKoZzbRKf83aocNrmEEmI50OaPU3yBFSB6C
	vk0W8BYWiHH+mXZUqMX2FLaojBCpYT7RrFiS16VmwvgVtbdMIVWZOBsJoBICknCJyBLPtq4J/di
	wWrfpAAzA5MY0+xIG3uryu8aBCyW5wnU3OLsguG0pDwtRtFi9PCLmwziwUvzmTPX6CD2JxyGQup
	kuwgHVvLoC+6UmdOQoCXiOjCaeFprvshAcAB4g8BvBUQXOKtNC5U7PE+NhBw/pHFo8AGFyxFENu
	iHF39u1g47+GVMAc7RZ5UkPjdt30m2F1lb96/FFIE4k39hjHQz8uYH5tLA5Ew5v9IetjWaBmJtn
	0pyOqC6UgvoNsaVXko+j65fZT3bxJAyI/FMjjIOZUB7rLeYDSfR7nBOaKWswhYJfOkTW3Wbrov3
	1ZQ5xEOXZsaSNAUpg6seklcJfvfYCsKC7yxsaukEmRcFXDX4dy3QQlClI9cICJ/0AJUE9yP3Mas
	Nasw6bIerd5JqYUzRmzATcYX9hrb9loTivDRRityaDh5/viLUin601PADKZbWFMFMmohcHhZIg
X-Received: by 2002:a05:6830:2b0e:b0:81b:9104:5ad0 with SMTP id 46e09a7af769-85f052a28b0mr2500096a34.0.1793911946474;
        Thu, 05 Nov 2026 12:52:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:08 -0700
Subject: [PATCH v8 07/11] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-7-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible to identify this fixed configuration, retaining
snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..fc1289073241 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

