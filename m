Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBD81859
	for <linux-sunxi@lists.linux.dev>; Sun,  8 Jan 2023 20:55:48 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id u9so15624051ejo.0
        for <linux-sunxi@lists.linux.dev>; Sun, 08 Jan 2023 12:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crpfjZM94sBjTdlu1shG1LkqjgfplZcyyBtcQUiOMZo=;
        b=kKwYSHIw+6aI8aCXdVDcWaaFk5UXs3VY6mf4QkJwi7JLvFClmNB+5gh/OV0YFQL9e4
         K7FgzsbXRsvhTanibJikhGZg2Y3n/gpGYwDRMksGkCsdVvQ+p4D80us2LIqBaKpmXNKk
         FrzC/FJ+2xvNV28VmIvOv4fzchKqXKfeKLYGHV7K1IvfqmpKrpjf3RJJ1eAIzOrxXYck
         WA9OG7SLz1GsAa/v84UDSnggnxa27Ej72lIaUyvPWyAuI4rEoN+FxP5eUMfT+3iHqqUv
         RIyp/jYdLjrwwkI3wP/pJdf24Et5jZkrK3NMKvkXQCBmB31c602BRep3MJSnlQF/IeqA
         PWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crpfjZM94sBjTdlu1shG1LkqjgfplZcyyBtcQUiOMZo=;
        b=yExJI5l1NQMgSitJgRRcb+rodDIVXl1m5vty42OcQsAQJ0xLFYQyU2Py826iqPKrMf
         6+CmBO/qGMAg7dGW7BXU7hzoTo8kioM3nG9Zway6pV9GQVfNnG8Gdm06PrUTef38rFEZ
         Rer6u+DXkU1cTQSFoDMHrhIrTVrrp3MIYUgyfit9FuRNJAB2jwWdQ79jgpt4DpKZBwIe
         HnjQh0PYa8HN0sB2/dQp1KYnonFf4R25jca2nHPa8qWlmg2sqJ/tzjc1AF1I3G0EA9AJ
         FaI2Y9KDlpwLczNhVuVuM6jlEBTxEvG1/UCxgdyDwdZ/fBXFmLrHgr0nsAxA/CQHLh0l
         QZgw==
X-Gm-Message-State: AFqh2kp8VCBORFVEKFSklYFAnXdm1x57/54vOGOoYtnr3LV1OPSkB6vP
	o2lKfszTg8fCEBwAPY6pd/k=
X-Google-Smtp-Source: AMrXdXueoz05zEL9B097p+4pYDjTnklX4awORsEgJzQcdlTb0tvcDQfwnjHZnDl1wgUcHhLd6A3bBA==
X-Received: by 2002:a17:907:4d8:b0:7c0:9a2f:ac93 with SMTP id vz24-20020a17090704d800b007c09a2fac93mr42824575ejb.31.1673211347114;
        Sun, 08 Jan 2023 12:55:47 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id ti11-20020a170907c20b00b007c10bb5b4b8sm2849210ejc.224.2023.01.08.12.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 12:55:46 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] clk: sunxi-ng: Avoid computing the rate twice
Date: Sun, 08 Jan 2023 21:55:45 +0100
Message-ID: <3433729.QJadu78ljV@jernej-laptop>
In-Reply-To: <20221231173055.42384-1-samuel@sholland.org>
References: <20221231173055.42384-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 31. december 2022 ob 18:30:55 CET je Samuel Holland napisal(a):
> The ccu_*_find_best() functions already compute a best_rate at the same
> time as the other factors. Return this value so the caller does not need
> to duplicate the computation.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thanks!

Best regards,
Jernej


