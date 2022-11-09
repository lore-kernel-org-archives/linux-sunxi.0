Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDEBEC0E
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Nov 2022 17:12:16 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id f7so28103360edc.6
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Nov 2022 09:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdpCW3bc/jcdSgpgyyMyHoNFC6KThem8jvb+gK7E5/o=;
        b=pK9msVoQf50NdtWtpIXXlkZrHnEWpyZYXzAWvx61omamtFI3Hu9csIWT7JT3lPtr6E
         QGSVrULPRqSRkC5295UNjb4Gj8EQfoiyRJWy4+k1lbfY3c+22OIoEXc8g5nfZkTV4heP
         CXGhOI/q36uLYf2xENguFOUu/oWcA5n9klh5vf3ixcoi7oqg8fWj1iuiHvZUESD8GI72
         bVYpLNx6PFAsGOn1FOnCG2r7EG9htj4Y6vpzkNvjTv+gp6Fp0BmTBPh/RGvEOKhUe/5q
         8gzhh6JPDz2Vu7+kUIww4/c0yjxxR6qdfrdHw/AMiZhMOZkBBCYzloy6WHOX63huRt4j
         gyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdpCW3bc/jcdSgpgyyMyHoNFC6KThem8jvb+gK7E5/o=;
        b=AEaHOJnVq1g3PMBqp/5bPXvH5g+W6ZG3NHszaP2tFZMZ/CTN6Cnb4CH2vJwjD+tyXa
         PVJLxuas5VAlSEdqVyz1aATywiMxeK9sCBCrjOckjt1Yj0YwFcM8k8xSkAUNltZ69RdN
         0cnbL50/vhyKPdmt8dCb/jOQBrBwDBVgysCuuRqMjw4088CyNw5KCe8XogL8P67M5k6O
         QJkxboAPALvCKR5rgXuxj/6iKgGB5EkllMG3NABPU0jg51dqrmpyYVYvcBgv2EcfvVi2
         FXS55ooiKw85dL2SXNgCicspj8Dm3isSYth+tZm/6EfV6gVNzYs0mGg5ncGkPm81lqHz
         NpSg==
X-Gm-Message-State: ACrzQf26y9oDFrn74q1MxDwMKU9fZGv6VpiXLfo6mHP+TLFfInsm7/Mu
	RJvf8jN/PDLWOTaEYtTPC6I=
X-Google-Smtp-Source: AMsMyM6EJMzUY7rLwPusiIvQLOBzAMFWUGe22HwzXfwYL4gg165ptAUE1ivXgSZer5IhdM6K1ztEtg==
X-Received: by 2002:a05:6402:344:b0:461:7d4:9c9 with SMTP id r4-20020a056402034400b0046107d409c9mr62045783edw.141.1668013934364;
        Wed, 09 Nov 2022 09:12:14 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id k10-20020a17090632ca00b007adaca75bd0sm6154098ejk.179.2022.11.09.09.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 09:12:13 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Wei Li <liwei391@huawei.com>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, huawei.libin@huawei.com
Subject: Re: [PATCH] clk: sunxi-ng: v3s: Correct the header guard of ccu-sun8i-v3s.h
Date: Wed, 09 Nov 2022 18:12:12 +0100
Message-ID: <6441491.G0QQBjFxQf@kista>
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


