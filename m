Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190717;
	b=Xlup3GTs4+yEvBuG5iH+r1Z/55DOa9+OY+CGOG8LSCLRDLQcBzw+BZOMeJNBbwWpqTQ/
	 WU38wtTmdecAWLpH7eIO+ToxWYXFoWrlmo2Flt5eUEkyNVS2cNaaQQs0h275zH1lhbVb8
	 Uens40w8p8XX7zknzShk4U0c+lueUIWEhQGmQqnQo1KmCJzzKiWGeiSE845u3I220phzz
	 MAOuou8BhNp0d7rmaRILKYwnEp9sAaXVcJf09iYbcKM+fbWA18zUtdWk5XIrYsQXZNUiv
	 tKYn2RO42z3wV9dsBAEU04odaAvjkLOWYfnEwG+1ThFOwGKeq7W0Jaom5T0kGKSHWHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nmGAkRQuZY1WnXUxjgDk5sO5Kth0S7mM5PEwkEwxFCo=;
	b=dgNKHhHDz3KoKBNlW3yWJcSBEMlsLKbEhejtl3TpQafQzofwgtoig9H79+NMGYtYFwu9
	 3BxJ2HqR9BfqSd95FK+WxIC9aLesmwdmFMxYjZP9eHoSj5I5Hz9Zzn7CsAp0kpCtoJpvF
	 3CSPfHONtqH1+MFACz+2dLiDcX39AZJJKDeYZD6B+q71sgiWb5voUfeUf3DdoYgt3j/bu
	 /kHvmrxu2xKgZDOensXRTg8Qe/IiCweQ9cARu5WLIdlTwd9Aqxe++rUDPCa/cp1pDzS+X
	 COQCOzrIYmn/DBI6GWzC8g0MRaabjPN0dDKYu5yvb5tpNNOfja6h8YNG3UA1jqhz/sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSrMF7g5;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCDC606A325
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 16:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DCDC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSrMF7g5
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso622488a12.1
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 08:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190715; x=1795795515; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nmGAkRQuZY1WnXUxjgDk5sO5Kth0S7mM5PEwkEwxFCo=;
        b=gSrMF7g5T0E1GFb6Si6Y6UWJkWbspvo+/dBYVToWEyxzlYq0ltqPg07S4pKxZPGBbX
         5XTISr/HscCDoMfzrlpESl13PrEnD5MU476pjiGOYqkQ8y5WhCEiy78snOeakSx4QDVy
         DdzmBZfSGF2XIqDuhnCRL56g+dQa/qkYOJKzM76ene87qlTkKAZJhOvG7n2LVZWvCocv
         6c9fmIQ2vM586IN5c7CY2JRhAi6JsF4a8Vt9E3Kx6fAsmaVuPm7Ivkb3x/AGdIAhdWHY
         u/P8wmD255LrXBZ04bYu0SOeu0Ijf7U+Vy/IprPq3fDXc/rJCxLSD+J2oCXj/5WTutzh
         m+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190715; x=1795795515;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nmGAkRQuZY1WnXUxjgDk5sO5Kth0S7mM5PEwkEwxFCo=;
        b=duKvfkwAdYnOwW8iVPwDWZNJzqm6bTGAVYwoWYj+fucEYr9k5mPjPbYyzfxaHB2E8F
         xdy2A02O8I653ny9HwV4+Q3ZtONURKnVhmFrJ7gwhPyEgNUCLSipgvHYiAkQxEHrwj7j
         8WguUbvhbw+Gjq57MNSm08jtkxjQsG8Gq6eZzHwK0Yopd2WmV34jn53LvWW3+KsHMW2l
         rGbxky0nSmezoOuEL3SrspOuIIrFI5a8B8M1MMKmo2jgI3BXlmyxpsuVz9E7YCCjQ3aS
         XahFbxFOXgO9kg15zKMVPlW7acJRbQ1FQTXQ9NTLXn4s9eTnP6sTME3daPHzM54vpvLb
         dzTQ==
X-Forwarded-Encrypted: i=1; AL+hErGea/DJ1xZGt/nOWSe3EcgF2clgjL3KX8vOdszWjWyqnLeKxGJ83A0ES2t7kS6npWLhigvrEi+SgUZQqw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8EikmQaO2OSgK+YpjVrmJp2WCq0b0rlx6mC6eKYCocA6f04Q8f
	CkvAEo5AJ0wMEsxbjapGrFyEpu5yqgPTefCiQKEpPeK6jEq7r2QKXZNw
X-Gm-Gg: AZFdTZfVGieBKrHvfXc3xtJxfN2DfZ8NM3rm533vG0gpu/CD/DwfcFH+7f0xpp2U6YH
	0cHtKk3sCru4yIYPxg57ayw+/iEid9P+/jrtQjcIAHWwTXBXoY4PGHLhCUqMpUlS+pyYFFQvK4B
	EN4Ac3vTd8pfIUo2GCYtrnLEkerc6QGnskgeaO6jGE4ixuuNPO4Potm4ZUKBreen0/8RTqxISWf
	hzCCLWNWAuHB76k7W3r8CT2ilxCnHvzSDenGMuNvqNZ69A4UH2MU4NrzYcp7ZpsKq/GrN9X6kfE
	0cIAV55PXHWw4Mxt9R+H6fawgqozUCn6rVaiWdK6LDimymWAeC8k09vuqJd1qKXeSXE5AoO9iTk
	7iC6DPiEyDyzm7sdoug4HmfuN4RzSIiaL0FJ/zYCJ8l5QsB/7thWYSRsSR2zx9pT2vOAl/b80a8
	rFKioQ8QhhgL3CmwLAHZrTb7lRwttQMdzZravWYlEtYpWNCaRHJcdfTLuF2jszEknVdDCYt0l58
	AqeojyAMCCkUWuYK6S7P7og/rgg/A9nTv7SL95tveE70lZfwbQSvmcH2uHuHJaEr5zReDML8Mrm
	aPHfgwvFkOY5vvjh3aV4RL1DanWrSRGBoN8tNv291ziacFTTuzwtekVQxXLimNO0qzwDRWUcpJx
	+rbmdLzbdl5iJ7DbhC3rCzk0=
X-Received: by 2002:a17:90b:1dcd:b0:3b0:9e2c:9b57 with SMTP id 98e67ed59e1d1-3b41c7c7a57mr3608641a91.4.1795190715046;
        Fri, 20 Nov 2026 08:05:15 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:b6e2:dea:3892:877:4c42])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm1603907a12.0.2026.11.20.08.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:05:14 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 21 Nov 2026 00:05:02 +0800
Subject: [PATCH] spi: sun6i: Release TX DMA channel when RX is unavailable
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
Message-Id: <20261121-sun6i-v1-1-ce211aace0e8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVpS0tcRSyowViUdBCJuLti+
 SX/excwBkKGKrkg4EFMi49QaQJuav2Igvpo0FJbpbQUvHtLwmRYmrbIO4cSYrsGHOj8furmN+/
 djG57x3DfDwoQw2ZpAAAA
X-Change-ID: 20261120-sun6i-53e85a74bce0
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795190709; l=989;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=g4Lb6UCytjHFAliWTA0cYV0Jre5Cf+YcZAPH67r/ocE=;
 b=Dd0N3HYfVymgF6axdUG4tzKPVuPJMdg0NT7r/hxBQv1Vpr01tfeYh4tAlWsi7ze8GekFVwrPw
 Uixubio1FDTBDj0Lc4F9ZG/XqRxTfDJo76IjmmUeBFAlPEllNz/WoOP
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

If requesting the RX DMA channel fails, the controller falls back to PIO
because DMA is enabled only when both channels are available.

Release the TX channel acquired earlier so it is not held unused until
driver removal

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-sun6i.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index e9fce8618299..f6d1699f1116 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -709,6 +709,10 @@ static int sun6i_spi_probe(struct platform_device *pdev)
 		}
 		dev_warn(&pdev->dev, "Failed to request RX DMA channel\n");
 		host->dma_rx = NULL;
+		if (host->dma_tx) {
+			dma_release_channel(host->dma_tx);
+			host->dma_tx = NULL;
+		}
 	}
 
 	if (host->dma_tx && host->dma_rx) {

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-sun6i-53e85a74bce0

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

