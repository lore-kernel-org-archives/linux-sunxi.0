Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031387F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 17:04:57 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id k27so20559553edk.4
        for <linux-sunxi@lists.linux.dev>; Tue, 03 May 2022 10:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Llux1569NzUGvGM3wc1L0NoJ1TWRs67+M9td/EKgsS8=;
        b=LBIZ1Il6R7kqdkfddyTa4l2Hq34loocXw88q2ozpDb+FNoLle2ntgRjjOYmvBDiqcv
         ehJRW8h3XriGv4zcW7ht8ELMzUVkzje+ucxEWrXx0Ns+KR4+qyP7gplWOEgE4tHfMPuT
         hzixc1MZztS3X+mrfVVePPPr217PldaQsWh2xiWPqjGWxhlELSmm7ZyNSjQgADLuC8Q5
         iBLzExUBpozpAtPyoJNl/w7zizH3NY2Im+NMWSM3/KvoR+69B/N3NXO4owBTzgK6mM7e
         Sm8wxuQQBSQL1uIOFl/bnY3kATg/nXhM25mO8FcJn5ar2SgbcPR8NTyTtntGYdeqGWCH
         jy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Llux1569NzUGvGM3wc1L0NoJ1TWRs67+M9td/EKgsS8=;
        b=Ud+xDlxvRraLI+tFOrWzxdtECcPNX7/kL2OI2hKKcNw8Q+hAmXkCJSWwiSVXux8TsE
         SYtMreigqZaaTHUm0KOodvEnvwmRI7VFs2fn9bTJmA2IyXBLcAZDhjBsn00UnPstSS2Y
         J+JwAT90X9JpOLb6bYId+agK+mQM00dZPxwwjq1NE/PepXdLPNIM38e43YJ/KLVW7hBP
         mAtdNWGB3nCjCCA/bqFc+y43nnSF+wxjRRMVXMAoQqKuSOAYpp7WY36BIdOgWy3LFarC
         cRpAt7hLmzbO16fVccBrNJRnQXjMZcy1SG7PydX6J8kKMvhxbrbYeAbpZ2Q8A5zSSJl0
         Hg9g==
X-Gm-Message-State: AOAM533ttm3rVA1d4KwF314RlwdfaaNBXleUxPADCuKgBkytgKR2Fvh0
	lpzbXP5GtBpN0KzNO2Cvh38=
X-Google-Smtp-Source: ABdhPJxKBqqN0x1U+bfaO30VulsuCZligPEBUBpZodTWAlJgYqKBg9vEZVhZ1bUipAlT29oxjz4rCg==
X-Received: by 2002:a50:f69c:0:b0:425:c96a:5c09 with SMTP id d28-20020a50f69c000000b00425c96a5c09mr18585026edn.256.1651597496218;
        Tue, 03 May 2022 10:04:56 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r22-20020a056402035600b00425d6c76494sm8028001edw.1.2022.05.03.10.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 10:04:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Harald Geyer <harald@ccbib.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Torsten Duwe <duwe@suse.de>
Subject: Re: Re: [PATCHv2] arm64: dts: allwinner: teres-i: Add GPIO port regulators
Date: Tue, 03 May 2022 19:04:54 +0200
Message-ID: <5816655.lOV4Wx5bFT@kista>
In-Reply-To: <ff554e7a-b408-74b0-e4dc-94f244e0b56c@sholland.org>
References: <20220430191009.73946-1-harald@ccbib.org> <ff554e7a-b408-74b0-e4dc-94f244e0b56c@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 03. maj 2022 ob 04:01:20 CEST je Samuel Holland napisal(a):
> On 4/30/22 2:10 PM, Harald Geyer wrote:
> > Allwinner A64 SoC has separate supplies for PC, PD, PE, PG and PL.
> > 
> > Signed-off-by: Harald Geyer <harald@ccbib.org>
> 
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> 

Applied to sunxi/dt-for-5.19, thanks!

Best regards,
Jernej


