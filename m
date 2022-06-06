Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B1733CB
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jun 2022 21:14:35 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q7so21459127wrg.5
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jun 2022 14:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YmrPNNtOBq+9JzdsAI7pGeIetIT35ohZzZpKBjsR0sM=;
        b=krnByREAlieaT/YieoQECd4AESlhGieDlD5VNa9heTv6fjEanrPCWBcR+u4euLtQbj
         LuYXEY9Dpv69Hr6QTbVreWrpAdNltTlp9Of4yRyqBj6Rv0Sb4zFp+voF/a+xlGXAHdf6
         sg5+60HlBdY4i9otXqkuerTIDt2ZOTKnP5Krnx+Y6/ZXp4M7OecTfGei0lMETTm7DN+a
         cNtq5zySTLp1IY6NJNBL+hMFu8m5J6LZRlLZyST0BY7g4dcZK4RfiNGmmQ+5HdXRly2w
         fNSSEu2/AZHVEeVhw7f9VR8fVUN11TWnznxTVl0N1B1XUM3+yqy2i3K/x2EROGp1xMx1
         fa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YmrPNNtOBq+9JzdsAI7pGeIetIT35ohZzZpKBjsR0sM=;
        b=YFwAWL1RS5k7Tkd+lUOJp/x1blLSvslHHH77y+SbAniTKTfRaw3HrffuNhXjFF6izW
         2ZMXLJULh/2zIiUmJW608rqpgf5AUYKEUV1QPGenXbTxSAnxvWScSU3vCcZvm5IE+Fb5
         iFmNkE7S4c54FYqnPFS8VN4/UyfTxfLS01HYAokgujVyviyhUHSmVpzEj+keAKr6fEpe
         yVw7bncvf882Q9Du8r0dhsPW5Gcg7rz/MbiVP+zpRC9Zr210k/eTQOOQQsAY4z/Ft2LA
         YSSNFDQd1joe387E6HSs7/WN5g9+EOORhNQ5WNG37IE7Xnn92tCxi0igYqsFzuWN2kfb
         RXoQ==
X-Gm-Message-State: AOAM532jIaDSMXJ9iX2FVcVXEJBM3Q2kDKrK55QNbY803VFkvoJ77egD
	nrd6c+qU1CnGH/7Dp90cSDc=
X-Google-Smtp-Source: ABdhPJwBEcE8NFT3BuH35Zqpn31zKlX00spaa4ApKSwBvyTlcFgmf6+Q/FqUd+aq41o0g6YwS3TmZA==
X-Received: by 2002:a5d:54cc:0:b0:210:3d9f:4770 with SMTP id x12-20020a5d54cc000000b002103d9f4770mr23322826wrv.122.1654550074012;
        Mon, 06 Jun 2022 14:14:34 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id ay1-20020a5d6f01000000b0020fee88d0f2sm21145210wrb.0.2022.06.06.14.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 14:14:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi-ng: Deduplicate ccu_clks arrays
Date: Mon, 06 Jun 2022 23:14:31 +0200
Message-ID: <2631629.mvXUDI8C0e@kista>
In-Reply-To: <20220531043539.41549-1-samuel@sholland.org>
References: <20220531043539.41549-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 31. maj 2022 ob 06:35:39 CEST je Samuel Holland napisal(a):
> The ccu_clks arrays are used to link ccu_common objects to a platform
> device during probe. There is no requirement that the clk_hw inside the
> ccu_common object ever gets registered with the clock framework. So the
> drivers do not need a separate ccu_clks array for each CCU variant.
> A single array per driver, containing the union of the CCU clocks from
> all variants, is sufficient.
> 
> Let's save some space by combining the ccu_clks arrays in each driver.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thanks!


