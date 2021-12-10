Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD71173
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Dec 2021 06:57:06 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id u17so5642249plg.9
        for <linux-sunxi@lists.linux.dev>; Thu, 09 Dec 2021 22:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kR78Vf9G/BpR7pM6V254GxdHt+F2Tbo/465DsK1qwKE=;
        b=IFsqpF0iQ2yOjzbxp5S4JHaKVkeqOG4VTmlNuqN+jfmsljTZbfrMD/cJxRhBLvxi2a
         9K+6vhZRqofHqd7+ko6vYbnQABBIhEykYsTJ4olKQsu2gnm03Jd9Qb2WSG1Pj0fdeVh4
         ZIBAhnX0oC5/47PiOn4yuvxDXUrRNXvYI1Wheg7aveZD2YD/cQUArZvvQOZYUNq+XrkS
         3Hhkixu+Ugb+FuXK7kDYBrhOAsCMj5ybstU0moOAUeGO2LuEJ06nHEHgEbsBMWTe0sh1
         xLdNnvMVa7Sstb9nctQerCvPj2Z191aZFTfN91ywKuaEZRzF088NOe1Mjrsok476dDcZ
         dOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kR78Vf9G/BpR7pM6V254GxdHt+F2Tbo/465DsK1qwKE=;
        b=3IOFNCGOmsSXrTXLYPKfx0Ee6/jES0kodhdMd79Lsp3pXdDRTlI7N1mlBBCc0EHoBU
         i/m4tBxp+GgktSmewjA6RIB1nL0z1JGc5rIkA8d0XPT/7uu3u43B1Hvv9PtJ6HEs/Y1w
         9S/cHE+nqO+f5uzz1u5ziDDkl7F1eFgSxZov9XSnnuKGYiSlxcLmFm3Qs9+B+s6uZGRk
         oWFopl/rRmXoyHdVzmL/YCxP2EaYnB7U+Qjz2ZXcUbEbqDNY7ndtAtcFQ/rUg9yqQjPY
         RwS2YQdCXrZ5oOwtp7De0c8Ayn6PwoUInX0Hz73iystGyY2Vv2DI+XM51iZwlCGiTZjv
         MTlA==
X-Gm-Message-State: AOAM532r8HyVuSWmTK0WWsHh8tz7y+g4ujVCovby8IsTQ+g1pgakV+6h
	wdbksFCzlQz5i3xE900bUUw=
X-Google-Smtp-Source: ABdhPJzQqiZpOZPRrLmfyUo+pIckIWEO48+EG7ury7tg1kbEr0hT0s/WZydwAB+KsAjlmhJlrwMUgA==
X-Received: by 2002:a17:902:e0d4:b0:142:8897:94e2 with SMTP id e20-20020a170902e0d400b00142889794e2mr73277767pla.58.1639119426164;
        Thu, 09 Dec 2021 22:57:06 -0800 (PST)
Received: from [172.30.1.18] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id i191sm1571372pgd.90.2021.12.09.22.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 22:57:05 -0800 (PST)
Subject: Re: [PATCH v3 6/6] PM / devfreq: Add a driver for the sun8i/sun50i
 MBUS
To: Samuel Holland <samuel@sholland.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211118031841.42315-1-samuel@sholland.org>
 <20211118031841.42315-7-samuel@sholland.org>
From: Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <21922806-e64c-1c41-1373-55603604cf34@gmail.com>
Date: Fri, 10 Dec 2021 15:57:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211118031841.42315-7-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21. 11. 18. 오후 12:18, Samuel Holland wrote:
> This driver works by adjusting the divider on the DRAM controller's
> module clock. Thus there is no fixed set of OPPs, only "full speed" down
> to "quarter speed" (or whatever the maximum divider is on that variant).
> 
> It makes use of the MDFS hardware in the MBUS, in "DFS" mode, which
> takes care of updating registers during the critical section while DRAM
> is inaccessible.
> 
> This driver should support several sunxi SoCs, starting with the A33,
> which have a DesignWare DDR3 controller with merged PHY register space
> and the matching MBUS register layout (so not A63 or later). However,
> the driver has only been tested on the A64/H5, so those are the only
> compatibles enabled for now.
> 
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>   drivers/devfreq/Kconfig          |   8 +
>   drivers/devfreq/Makefile         |   1 +
>   drivers/devfreq/sun8i-a33-mbus.c | 511 +++++++++++++++++++++++++++++++
>   3 files changed, 520 insertions(+)
>   create mode 100644 drivers/devfreq/sun8i-a33-mbus.c
> 

(snip)

Applied it. Thanks.


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
