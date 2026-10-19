Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440431;
	b=n86sshhDg4VX3RtxsFulXqiIpbGM3wU8Nn5+ZfYsiP3qPqKvwa09ATp76/bGhVCJTrE1
	 pwSXCrZ22HSI68PhQuEnO10soHrxvFqvG6OfrjYFuvhke8bWwlggz09GizcfRsClguX6R
	 6ctoUWoGKmeSlP+aIm6PyAxONt3TQbe8TKo6/dNIChbgPyLTR5vqNhnfINHkZcTKoTI7+
	 OOuGHepD84u3BnIAf49EMi9lEyheApP7uOSZsC3LHuuUwo2BWpZhLYcXlzlj2PpOv/2nS
	 JlkgyM5cnkiHpNqdQKcMPWUWoqtYI3HVY+7aqYAhV6kxR2gWMNKouEYvAVy274in5tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vseRokM4wlUiC0msrJS1ImPrMKPknh69JMExUys+m18=;
	b=qdP4iIC2YX0MBvLfI2cLYHXUVTOZTWpQ8f4T7LkcLihuyXmK8B5128tSPnq3WmOurAQY
	 U3enTukkFM/R/oIgzmAeV08lt6An7cBoAqgsmD2EhJnRSH5eG2wiCyTUW9RhdNOn7HlWG
	 vSS/ANOPYU8vkNTi4BxIEwHiBla7PZbFojV3eIFmOrinUFpZnqwy75Uk8BXSv+ITsH2x0
	 No6tEG+Up+BbV5l2v0FytmN12Tzt/K2mW78AoCM5uP/e/qW6tkA62pcDVL56nmMhj+lHC
	 4aXjFlfjAVx3hiGgiTssXQLtxo7P+G+aG1AmXXqkmwySHg02Wvg05+PHEdVtlTDTjRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PztEwnJv;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F35606A322
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 20:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F35606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PztEwnJv
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eabf243d05so706120e0c.2
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Oct 2026 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440429; x=1793045229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vseRokM4wlUiC0msrJS1ImPrMKPknh69JMExUys+m18=;
        b=PztEwnJva+h3aM5dSdpfk3T4yBAIbe6aP4mJn/v53kyycyV0HqZKFmZS5xUaBXUbct
         vjlhq/PV/aQWpyFaDia1k6dEy4NpKb4MH/huLDjchOTTl3Aa6Ie79McHPgXfV5elYe0l
         6BV/broQ8/4SWGFY8qCLtuLu/+hdwS0PcXD/Ar9J+N9IKWUMXmoSuiDAaHTCvLyiv7KG
         mStTK5S82QI34JZVWGirwUCPSbUTskShybpsLp0apsIfJL0DlFxbQvF6IK3czwsBQv7p
         UdU0nQ7qVuOvAP+M/QgWlyrgSn7uc3VPr+OliNijgAOzVKUyBjX5nFREX8W19kWDWhRq
         7S4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440429; x=1793045229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vseRokM4wlUiC0msrJS1ImPrMKPknh69JMExUys+m18=;
        b=p0HM8s90MHFx9rsT3T7CIozifjiEAIGEl0IE5dXOlbraPRPz9Gj9GIFfGL2AIdEn7G
         6JaUlNq+FJkeTi7Wy4VwHLKS28eCwnit6fuRyc6L8vNSpXsUcW+qtI2AElNv0jEMJx++
         yWBNKY7Cw0RzDZ3heSb4j/kqZQvK2i+P7fzVdVerdBRna4pnGyN9yo27Woj8f1gK9Qdx
         FClzifxvJ5mI0IEpP2EoLozAJzseXXNH01dqEhXOSUFVLM8dBhnxop3/aDCwBOk+AX5b
         A0DXMVTeom56qCE24DqsjwCkUGTvOUon4B+oBOGob/gzTJGrF7paGqc//UKfEVz0aETS
         hARA==
X-Forwarded-Encrypted: i=1; AKwUvBz7nhLzQcAaZKWNCwIuCb/HI9QrLB2yLRaJFsCp6pvSvH3p1lXv5sRr3y8miAmYFXElF+vW/OjGJyD7hA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKUv13I40elotXbsn5Vjco6ouHcFboA0j4h3zYKeIWPb1/9WatS
	rg47ZdymcxJqk4kmvpYVDBFmn5tRnHMQlnM08ppqzZnAQYX/SNfAiCB+
X-Gm-Gg: AYBFou3OJabGBNxzJ5n0G0+LuhbIls6x9NSt5qvQxCB1Kpjfv9AMLuhNwh8s3av7Y+A
	he6ruxbI+MJkv2Xh8mpnBhhQeGImgrZI8O55WOk//Wouo4DMgH9qx69lEwSO7a1Z/eK5bPyfk3R
	QP9oFED/qrxbtV3+ocHswxq6/0pHcxPuH4p1Ss6WPX2PSMUD8VXm2Catrw8wWucJsE3R+TfGk6K
	+NkDmVJekAuoGmBcxmjQCxtAAA/88xyOqn0J2ZnfE2KkmmuhkCfLFxoM/cGgKIcqSvRwv1YDuWf
	cIdAPWRcJEfOWrpgnfRGguaTgWHT0j239hD6fUXjwEbhs561UoLQUKsl3OxbV+bLXphYw943OAi
	svr02hMFDhDEd6AzQcMxqzNC/WXsySqdjBj/+4BpfEExJIb7tzSfTM3cNodjeC30BEeDYunv/TH
	DnHpiOelAAj2r2bebaGKzZ4h98rPl4tn7J6wzKIbvEVVx/CAOE1fDRlYs8mb/sZvYTKEfAKS0sj
	5sdzFiQ7Fvr2UNMyg0NqDzHaMDxnoYHEBQQ8eZgCsHhPMMzvbPAAqs0VHP++tWr6MfnCk41qheL
	JwS+KAk=
X-Received: by 2002:a05:6123:2eb:b0:5dc:d0cb:7d6b with SMTP id 71dfb90a1353d-5eaaa65aa82mr3039279e0c.14.1792440429039;
        Mon, 19 Oct 2026 13:07:09 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm10451611e0c.3.2026.10.19.13.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:07:07 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/4] dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
Date: Mon, 19 Oct 2026 17:06:12 -0300
Message-ID: <09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com>
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

The Allwinner A733 UART is a DesignWare APB UART, but it needs
SoC-specific handling so the driver can avoid stopping its clock during
termios changes.

Add an A733-specific compatible, with "snps,dw-apb-uart" as the
fallback.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..532392dd54cf 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -60,6 +60,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun60i-a733-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
