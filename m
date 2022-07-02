Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE51FA8
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 19:09:21 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id d2so9712372ejy.1
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 12:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z2CBJFGxLvkBWOdkPZxjACJXbe1IwaVXsAKYM/pk24g=;
        b=dEFwEOfX45v0//GviVpjqq5IWtx1JSow/BIplvzXFHhJDfZVVZRwAFvjWMcuWljiDE
         bY+mTufXRkY7HH/dmnUuqGxr4HTgrkmRR7CvEloZ3FosKcWTQs4XDmZigJTificdrYnJ
         JdIHy5wLklKm5bHEkS6oKE4/tRCOPylZVN+Z92nKXuhZOUMJGN6JBQ8D+5Xsq+g8JYA0
         FQAe3S0k/gZaI6Mly8W7ievBowHsieYDcnMcbbWsiasG90nkH52eWQasLnrSi228YPr3
         c3cDBa9FxD7oFI/CMURip9xEpkFC7frMszXR/ulRdW2hEf7Z3Pnkqy300qkkPuixqd7Q
         YmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z2CBJFGxLvkBWOdkPZxjACJXbe1IwaVXsAKYM/pk24g=;
        b=djCEPs7Fgunu1wmP2QDuOq643JMIiqFmCbqyXuVCijH80OtVzT1sxiL1A1H7f/bF1k
         aSgYvU1qGbxJpn6O+Dt9ypqFQQnoxZCjgQXps1CioTSYaG1+AXHb9dpwb7CggsQkCVEX
         TkXAPq7oAzWye1Z81bXRsXQR5AVve+qdUl519cIl0Zz+66wf864tlEgsIFKgZvrlbvuO
         Tgz3nvdNAaSVGeDpLCOn2qxpTww5yWpU//VUHgqZD5wx9D/i51usINr0c4dFB/vFVUUI
         /zTe+0W8dnbbdw4NO/yrnm+DtwdBVphPazp3QeRn0VzyWx/pdXuaHTFKMxaj1hODJ9Cp
         RJJw==
X-Gm-Message-State: AJIora+kltFv++4AmH1r2Kx2NAF02+dj+0E3TWzIR1MGy1UXu7TqT8G+
	SdNV/E//Pkl0zxSNcapLWQM=
X-Google-Smtp-Source: AGRyM1uESLTbCkv6TAJWwQQ356i4TjdJ29Qc9KY9qG4xOoR5XnMumEy1l97XJOs4eG+Cz96I//bGkQ==
X-Received: by 2002:a17:906:cc47:b0:72a:95bf:2749 with SMTP id mm7-20020a170906cc4700b0072a95bf2749mr6742877ejb.204.1656788960222;
        Sat, 02 Jul 2022 12:09:20 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id a27-20020a170906275b00b00722e57fa051sm12076348ejd.90.2022.07.02.12.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 12:09:19 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] clk: sunxi: Limit legacy clocks to 32-bit ARM
Date: Sat, 02 Jul 2022 21:09:18 +0200
Message-ID: <8956393.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20220702190135.51744-1-samuel@sholland.org>
References: <20220702190135.51744-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 21:01:34 CEST je Samuel Holland napisal(a):
> The sunxi legacy clocks were never compatible with any 64-bit SoC,
> so there is no point in building them as part of a 64-bit ARM kernel.
> They make even less sense being built in to a 64-bit RISC-V kernel.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


