Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587D79F7
	for <linux-sunxi@lists.linux.dev>; Mon, 30 Jan 2023 21:18:26 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id gr7so11217201ejb.5
        for <linux-sunxi@lists.linux.dev>; Mon, 30 Jan 2023 13:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUYTF6x1+3qI4HVoC6YXhtrodY1iWYPp8EGg4UuNUhI=;
        b=YrgcYpuHu56l99WKEko7b9aJXLBqAiFMNuwyhELT6f6XOGaFUdPQZcNRNYpggTgJuB
         99/1gr+oXzyxVUMt3vGqYXVLBXDL5fh57URDwjVmE3AQGs6u9IYEc+j5ev8xUnZxPw9n
         Kv4zxq2mlfD2N8A3MjQ0hq8B9fJwIbWlgv6crIGz3zYwfgURKKWP32BgQYzXukj0lU0k
         aZjmrj/KDrolFiZQLSdzmZNaui5ROMUhw5I0r5o8OGvbN70NiHmjhD8yuxvVnY9dRd5U
         33twbfLDWL549zt6TqQzUfEPPEki9m+r3datJC/z3jc/W20qlev2pMFHBnCxsacUsnS+
         y3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUYTF6x1+3qI4HVoC6YXhtrodY1iWYPp8EGg4UuNUhI=;
        b=nm6i/wQDhI6lRH69Aq7Rsy9Y2L8CC+qapY3dcm26tVYgYWD5AwCD+gnAvy4cegeSJK
         i6kmq6TvOak3OZElqHRRViAPcxZZodqJqLtnT226TOmdwWmUxpfIbnDLB0oCqJHVotDS
         jSkoneiM5F6WtrsZGAlBUulIfRa/FMpmXA0X6FM6YPFTEdT+hi9nc4U8EPjIbsnj0vwd
         uNdT0x6ci9CiBQwW97aF72x054sK4dN2Y0w4rIPj2fyRVXNOdYcZGDEcpdeJMLpr+69O
         I7iryPN1xeQ6ETaeuvcyBKVi/Yc/2Qd2P3u9fozx7YiqHy8KemclG2KGcC3Hfa3W6NW1
         Gjtg==
X-Gm-Message-State: AO0yUKUTP6XaSbdVTVMoHNa78dg5r4q4UtN1QfTBS7nvZwftEVtyIdlv
	G5Z+KT915woG3oeUv2X+wXk=
X-Google-Smtp-Source: AK7set82o23fzdPkIJFFGVSZ+utY+unOY3z/FoRJyDSfrsNVF+mI2rRxDdr04iimoYlGpzNJjZwByg==
X-Received: by 2002:a17:906:b187:b0:88b:28ea:5bdc with SMTP id w7-20020a170906b18700b0088b28ea5bdcmr2295828ejy.42.1675113505146;
        Mon, 30 Jan 2023 13:18:25 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id h15-20020a170906584f00b00886ec4f2fc7sm3088920ejs.17.2023.01.30.13.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 13:18:24 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: sunxi: select CONFIG_PM
Date: Mon, 30 Jan 2023 22:18:23 +0100
Message-ID: <4802479.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230130130453.379749-1-arnd@kernel.org>
References: <20230130130453.379749-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 30. januar 2023 ob 14:04:47 CET je Arnd Bergmann napisal(a):
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Selecting CONFIG_PM_GENERIC_DOMAINS without CONFIG_PM leads to a
> build failure:
> 
> WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
>   Depends on [n]: PM [=n]
>   Selected by [y]:
>   - SUN20I_PPU [=y] && (ARCH_SUNXI [=n] || COMPILE_TEST [=y])
> 
> drivers/base/power/domain_governor.c: In function 'default_suspend_ok':
> drivers/base/power/domain_governor.c:85:24: error: 'struct dev_pm_info' has
> no member named 'ignore_children' 85 |         if
> (!dev->power.ignore_children)
> 
>       |                        ^
> 
> drivers/base/power/domain.c: In function 'genpd_queue_power_off_work':
> drivers/base/power/domain.c:657:20: error: 'pm_wq' undeclared (first use in
> this function) 657 |         queue_work(pm_wq, &genpd->power_off_work);
> 
>       |                    ^~~~~
> 
> Unfortunately platforms are inconsistent between using 'select PM'
> and 'depends on PM' here. CONFIG_PM is a user-visible symbol, so
> in principle we should be using 'depends on', but on the other hand
> using 'select' here is more common among drivers/soc. Go with the
> majority for now, as this has a smaller risk of introducing circular
> dependencies. We may need to clean this up for consistency later.
> 
> Fixes: 0e30ca5ab0a8 ("soc: sunxi: Add Allwinner D1 PPU driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Although, would it be better if commit in question is fixed and another PR is 
issued? That way we can avoid issue with broken config.

Best regards,
Jernej


