Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9CC2CA2
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 14:09:01 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id z7so6895289qko.8
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KrEo2GCuaweGemy8293PBHOmtYudgFR5STZI5YThMkY=;
        b=MEDB8rvqo65L7vu7o2ItSwSPj2IOIZkU9WogC7kUfPwH7Iisz+8Qza+469VoNq40mi
         xyVFOHJlmFdrJEKwTPjsqrJwtFOtuETR32YbkDtvpKxekddYmenz7nGOOPH/nwVzxGXU
         GJPdpqYWXHzAUBtSlJjh/sQSYwBDx1c69OT6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KrEo2GCuaweGemy8293PBHOmtYudgFR5STZI5YThMkY=;
        b=lszdrO8+A4Z4LuxaFmYK9d4ADRBD8E/s4URZUWosh88yhXKHicwhbE8fmpO7CJc6Iu
         01EpYMok9RMVD22XV6OfZgbs7tTgOD1TiMkzKGvgOGdCzqy3kl/qQ58dKzhVHI0TEk3l
         ROX6231POFxFjVvLHGV2MzzVv43lLf3UkaIu4LPBp+9MXcvpNaS4FPcDoEnSDEbYoeaF
         qAQV8C9cebae8HniTCHwrHREeiXHZj7SFRQaKZ8p9K+1nyzWXUkw3l7BrriB18nH7JJK
         ITOTLOrb7P7pfuVzNsUV6q3fqOBYyQeS/WcfcG3Zc3ent5kNhHIdMiIOixKYffJIHlGv
         KWrw==
X-Gm-Message-State: AJIora/Hkg2XJ6+svDExcWt0Pc69Ik8UnZKbxLNM23Bekcsb9FU43Wvk
	EBI3xNGsdJLmB0tODER2Skj8Jg==
X-Google-Smtp-Source: AGRyM1ti9uUNK6ybwGp8OrY4gJpwPCjNSzrLsnBrovCWYxpINMi3EbULKJzpzwVT5C5/Fo0ofaYqHg==
X-Received: by 2002:a05:620a:112a:b0:6af:1bb9:fb91 with SMTP id p10-20020a05620a112a00b006af1bb9fb91mr5388183qkk.229.1656338940756;
        Mon, 27 Jun 2022 07:09:00 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com. [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id z16-20020ac84550000000b003052599371fsm7171325qtn.12.2022.06.27.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 07:08:59 -0700 (PDT)
Date: Mon, 27 Jun 2022 10:08:57 -0400
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	qianfan Zhao <qianfanguijin@163.com>, linux-sunxi@lists.linux.dev,
	Chris Morgan <macroalpha82@gmail.com>,
	Milan P =?utf-8?B?LiBTdGFuacSH?= <mps@arvanta.net>
Subject: Re: Pull request: u-boot-sunxi/master fixes for v2022.07
Message-ID: <20220627140857.GT2484912@bill-the-cat>
References: <20220627004638.517-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627004638.517-1-andre.przywara@arm.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Mon, Jun 27, 2022 at 01:46:38AM +0100, Andre Przywara wrote:

> Hi Tom,
> 
> please pull the master branch from u-boot-sunxi, containing final sunxi
> fixes for 2022.07. The main attraction are two regressions, plus a fix
> for a long standing bug:
> - Fix USB support on boards with a switched VBUS regulator.
> - Fix failing boot due to env loading on boards without MMC (CHIP).
> - Fix PSCI CPU_OFF operation on R40 boards.
> The rest are smaller fixes, and the forgotten DT sync for sun4i boards.
> The gitlab CI passed without problems.
> 
> Thanks,
> Andre
> ===============
> 
> The following changes since commit 75967970850a932a2359e167fd9950b01e9b99d3:
> 
>   Merge tag 'video-20220625' of https://source.denx.de/u-boot/custodians/u-boot-video (2022-06-25 08:38:00 -0400)
> 
> are available in the Git repository at:
> 
>   https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master
> 
> for you to fetch changes up to 47ca7b574faaa514677457e23a7197c47b0b597c:
> 
>   sunxi: psci: Fix sunxi_power_switch on sun8i-r40 platform (2022-06-26 11:22:54 +0100)
> 

Applied to u-boot/master, thanks!

-- 
Tom
