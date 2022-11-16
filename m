Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4CFD532
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 18:46:22 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z14so31243855wrn.7
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 10:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwJWWDBntVeku1uedvJVLfXfsM4W2+ZHodqQlFwIwe4=;
        b=OibLO0sDtzDXMimFfooed4Mm/dgLbyq2mjRVnOCEfks0t5txdFiJxkccrWJg+aTekg
         cqkVzTwGUJd9LIZKW/dOjzSgdt3CBPQzoEf3ud1bClR3NCT7/Si6Xs1T6FBIY8u1z0gt
         EDh6NZvFsWXMQnNRtP13l40LtyCIpikqDBDTB2M9qboqOQnKoA5XGTizcEAPqgxwmxwy
         hNMqXThGe/Cx1I7nnW5+3bf2laRThvjIPtus3c0JOPGcrWqLBjg0rkYAZ4nSVIKkR6Wb
         32uPcg/u5KoO6pdoKmx4iyPR8Dpls+VRwd9z5a0x3oIxglYWChXDk4JghpMdCuObz/lJ
         srsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwJWWDBntVeku1uedvJVLfXfsM4W2+ZHodqQlFwIwe4=;
        b=gS+3Tg9mTLxBu9sAfldqft+O/aKmdIV8mg5L5sJsVfpCESUU0RV4IE3l3VSJLxd6BK
         7omhLCKnHuFeraAWSYF7Zku/uvLlgnrT/tv1dlj+tTst3B3OBRLbqE1dnjpjPEehtzBy
         K85Jt83vmgbE2pQdK1RjJmPo/UEyuqNFnSybo23QvvUFJId8xTTv96tL/Pc8ZBljJgVT
         6UY4kIMMMf0zc9RNqRyupRNqAC0RTtcycJFpqFGeKOPNLZAJHv0ldPP3koB8ZULjiLpb
         I0PrH6+n85byPhjxyi5fZQsCnSotsTbDEgoac0w9iHBRN2GREmGCyG9bjV08WMDPJzkd
         NJ+w==
X-Gm-Message-State: ANoB5pn7CiiZ8a/6ID6zz/Urz4UZHhTA/tzbPyAxUSz7dSBOe4ghSf6j
	2LOiXuYvbTyYbGcj59gEccKRfYfKjV2x7A==
X-Google-Smtp-Source: AA0mqf4JvHTxi8KK+MvHKwXoWZs8vKCo+lLf+kIDv9+vjextNU3TcfsfMIZRw+SXCq7BnCmhY9Z9SQ==
X-Received: by 2002:a5d:4589:0:b0:236:698d:9c44 with SMTP id p9-20020a5d4589000000b00236698d9c44mr14667418wrq.571.1668624380454;
        Wed, 16 Nov 2022 10:46:20 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c4b9500b003c5571c27a1sm3165422wmp.32.2022.11.16.10.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 10:46:20 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Wei Li <liwei391@huawei.com>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, huawei.libin@huawei.com
Subject: Re: [PATCH] clk: sunxi-ng: v3s: Correct the header guard of ccu-sun8i-v3s.h
Date: Wed, 16 Nov 2022 19:46:19 +0100
Message-ID: <2259258.ElGaqSPkdT@kista>
In-Reply-To: <20221108094335.3597008-1-liwei391@huawei.com>
References: <20221108094335.3597008-1-liwei391@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 08. november 2022 ob 10:43:35 CET je Wei Li napisal(a):
> Rename the header guard of ccu-sun8i-v3s.h from _CCU_SUN8I_H3_H_ to
> _CCU_SUN8I_V3S_H_ what corresponding with the file name.
> 
> Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
> Signed-off-by: Wei Li <liwei391@huawei.com>

Applied, thanks!

Best regards,
Jernej


