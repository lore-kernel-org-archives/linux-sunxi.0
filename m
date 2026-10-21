Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616541;
	b=vQz5Md1WWGRyRG2KBq+t+OENj4C3oA2x4zTL842IHpXE1LwQg8XqGCarkxCKtkqxA/Z1
	 S0jS8qTJp6Ai5NDNB5anH6nR87dGmEMUMacslSY5ALfFecNyBJpJtQUOywB5bs25HK36e
	 c21jlzIePgTpWLzhAoJjZyTc66aCo+uLWH4rOsZkFFaQKdRdCA6unPD6PptO8Osz/KFk9
	 kl5YtJ5EHCTdrdco5pA00K9XQsnIhNhr4RQOhcUnqCPU6y3Ul+9xMvAIbVHK33tyWyOPW
	 95N8Rf87CvYFSdKHACUuP3l6TPJkjsVANexnL1xPsyUpfbp69w69rfBKYXev986L9NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
	b=hl3LIlV2sk0693GSVPL8ogjfdzxQ0oHNW/rHkAcC5lFBiVDY8CEhBIbw0+cMsHfh7P5U
	 T/7dih0S4qkTkulX0DQ1R7ojinE5HmCNK2A/mqS5+go9sxihseLohI8z1otwy7UK0UBH6
	 5pnmCJaNM4oQaTYqbj/6RbWmh2buNdlouCMW/UlhGmI8h6cve6M+dVlv0d5N/9BGGzzkx
	 PIXiQsMT4n7VIzn877ytJuRr1yL2a8VXN0h19r3veush6XwdDIGM/PfRqun4LLRAUwHlx
	 k2MpD1RYCIVuDCb//GdaZf5NawavZCWdqOpL8dFCXwHbToJ4EaoK4GiatAt5s/ocHbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bpoaqErg;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E60606A31D
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 21:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E60606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bpoaqErg
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6d00d120b28so787899eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616540; x=1793221340; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
        b=bpoaqErgGUdhfgB2HUqZwOuo/yJytEiQHKbjnOIQWaaKR9U+hp58LSjz47IipjOlT6
         FXBsWxCRgMv7A2yBP4yxOaD/8vDr1cTZim6EZ/Q1KiT9hddpNI+pQceKXI+8XH7YCj/Z
         D2Ky1p9HuxDl9PcPUV/MW+TvPcefz5RaOvbZuZBb6WCX3Hr1F2iO0kGno9adxtnLm/J8
         1bNYeAF78q3LL7xA9EU2kVoxN+Yvb0koisou7wpBeNVYlWXi5wZGShDPWV9FaN1VxyeZ
         rf8yviIrXhUlWt3weehg/sU/sHm/g5J6PoifYpX/gjVGS6/aTI4Yn2RHZxWamlTDcdlT
         Qi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616540; x=1793221340;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
        b=zVAi+UJ08HBNKClmEpysmdwaC62JKM80V8GSShfxM+eA2kRIFt/CnlQzU5pAu+BRh/
         3tbq9Lrt1wudvhyhotLivrDY8JOXXYAA7S/3qHDuokdfKwoeud1A0ZPhMSQ3vF+qm0bI
         E/Qj1QAq6WYwMKR3HqhNLsSYouPLRWntIqzRtvJLAyVoHet1f0qUg9K2qymzjtXKljRC
         fgVMpFAK0su6BwWHA1mVyVRX+F5SnfUUzFk+cUBiJgiRwltcfzfMcTdsOeBhbIumo8yE
         7ZmjAuUYsDvmB90JSFANc8ZKJ/6+g2ner+iuBH6uU5thiT4AtAhftrhNSZhMDqRrHLp5
         foVQ==
X-Forwarded-Encrypted: i=1; AKwUvByh575IyW+kl5BKsrwwZR4Wt1o5z2Rbx37CvABFGs5K8SS7rQX+6WaRrA1dTP5JZmA5EQLqI2L35yOmVA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIM3e4SwHaESVa+sC09ppYYubJae3hd/AI9HtKpqrM1RvQ7gGep
	YyjU3CN9lohWyQ1k+A95k4xGDqir5OtbZOCgFGhHIV3bJJVTPzPSDXGE
X-Gm-Gg: AYBFou1vNAfPsF6gTEJ6B1lQworN/D2JsWYl3Lfr+RiDgc9sXReWgmiWBlv3FAzKZQq
	LFaQRE93Okm5CqBkGrN4dRdhA/OFCxIo2SuRjXhqpZsN01oJFil8oM7GH84NApDltp4pD1eJDWS
	udghpVSgcKsxFXcmMgobTivKkQfezRbm0clky0oez8V2qoHS4bO83vDl1rIEmHtIBysvBl0zkjL
	6yOUPDwx4gujB0WAweQIKlu4d6gQdh5WNTFU2iezbR98zl0Ukb9r84+S7L43T9YUHLxMOEIwk0/
	y+F894B8JQEi5FP/paOBinqbQIL+98A1X34v8rs6vkrA08G0DgbNZZa4GBHNUMjKuPbPNGfKQrv
	fQeTyxFJH92GVc786v0CSw03G4jOWJe1RQj5UGE34A9LMqhI2/hqqlLKQ6dzq3Jo9IQ8NHTqhBL
	dIy1tZQ8qQybEc1+6eeRWi5DsR2/ndRz1TXovYJfNcq9FUONR68v+cpR1mEFB/Vel7UCQPoXsL1
	ZUmEGrLj2bpI2mpYjfnLiFqiM2IEXLgj1/F0P2fU/pdsNpILUOcT1hFiwt5r97rWSbVWFBBhmE4
	C9JdD4b/cRC0GqXrDGwu3l27g42V3YnLbrPU2waO0Vz99xaMS4X8Sn6hy28PT0UJoNvykUiSSZd
	btLvTeRT4oew0gGkibqvOqDyzVegNzfo8J/Ndsxy2bjARV9Ij38y2qpnm1fF6HJtrroaQPS8och
	5CWZk=
X-Received: by 2002:a05:6820:83c4:20b0:70a:6888:2274 with SMTP id 006d021491bc7-70a68883cb7mr438594eaf.45.1792616540307;
        Wed, 21 Oct 2026 14:02:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d61ce790sm2885699fac.11.2026.10.21.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:02:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:02:13 -0600
Subject: [PATCH] dmaengine: sun6i: use the channel pause enable bit
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
Message-Id: <20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2wqDMBBEf0X2uUtNChr6K6UPuWx1C24lUSmI/
 95NfRrOMHN2KJSZCtybHTJtXPgjCubSQBy9DISclMG2tjOtNVjWMPGiIR1jmjzOfi2EQbvNYGd
 cNPHm+j45UMec6cXfv//xPFkFb4pLldZF8PWdvcSxVmokGVjoev6O4wcRv+NjowAAAA==
X-Change-ID: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The channel pause register uses bit 0 to suspend DMA requests. Bit 1 is
reserved, but sun6i_dma_pause() writes only that bit and returns success.
An active peripheral transfer can therefore continue while its client
expects it to be paused, for example while the 8250 driver reads RX
residue and copies a partially filled receive buffer.

Use bit 0, as specified by the H616 DMA channel pause register.
This fixes the pause request itself; it does not add paused-state
reporting or change the handling of transactions already on the bus.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..204b0b812431 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -60,7 +60,7 @@
 #define DMA_CHAN_ENABLE_STOP		0
 
 #define DMA_CHAN_PAUSE		0x04
-#define DMA_CHAN_PAUSE_PAUSE		BIT(1)
+#define DMA_CHAN_PAUSE_PAUSE		BIT(0)
 #define DMA_CHAN_PAUSE_RESUME		0
 
 #define DMA_CHAN_LLI_ADDR	0x08

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

