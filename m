Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E6A17EB
	for <linux-sunxi@lists.linux.dev>; Thu, 12 May 2022 07:29:22 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id cq17-20020a17090af99100b001dc0386cd8fso4110113pjb.5
        for <linux-sunxi@lists.linux.dev>; Thu, 12 May 2022 00:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P5HUXEPOvBMLE8fEsuwCBiB+Q1qgQLDGbaTHhCwoMe8=;
        b=o5Z5fV0XV36DZH9ayGrfnl8qVxiWuzspeT5gnxwUrHidCaa+tEthe7DF0xG8IhHRnH
         jbDAxfFA+vFhlKs8TliSi7SNZQNw2cTItQSYVMabTBsOE6/aN6wtu6u+mpUqn1RUfgFS
         979KmVpZazbdbBvOVinimrA1IoyyO+lowJnL5WpIoDN5cmF9z5vmc7Jz2eFRtDEzfp1t
         L6pxr8VVt02arwTG33X8AwuJImwvj+620Bi8T9JcN48MEr0bxM6TEj/nyvTI7cyJECCb
         HGuduVAUgYq1F7DQagX3YRgMoRXkXQdgYIQV7Tk+BeX4HJfnPiCxdaRg2lMuW7zN3U8C
         Sl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P5HUXEPOvBMLE8fEsuwCBiB+Q1qgQLDGbaTHhCwoMe8=;
        b=567fDoPTtgF4sP0ecHALKJK29PZhpSeBGF4hkv78Lg/KAZiDK5KaECN38GjH0xeuqM
         oz3b5A7VB924uscVcssegZdTKUzFYJqJRLNJNH0FuYmWsbH5Q4wPtVZ84D8+4PFxVaUR
         mlqVy7KtbL05idf9M1AZZ5M3KOAzI60P70RtcdkjvN+nYFaSx0YK8vAV0qvBZw7oxycv
         Ok7+B8M6DDaTY2J/mN+7VrNw6PNyY0MmjDJcbjfKO/PWA9H+k6gMOiC6kKhHBjVS22t3
         W/xjpWGAGI8g2a8V9ZqEq1obOPjT4tKw2syO173Cj03KCqXOk4z5Q6ZEoz5z+wKoQ1kV
         I6Bw==
X-Gm-Message-State: AOAM533hkS6hoPMn8cYb2MYuMU34zvu54bF1wSE97yWg1EuqK1kjZHSc
	kpfUHjmRqUJuLQmXCnbizK3+0g==
X-Google-Smtp-Source: ABdhPJypLn7YyngE6rmboJLB85iyymD1k6g9lMwHwVnR3EpfOxbp8POTUSTQMDHng1V/ia/kWWRoKA==
X-Received: by 2002:a17:902:b189:b0:15f:3f5e:b61 with SMTP id s9-20020a170902b18900b0015f3f5e0b61mr3417397plr.49.1652340562190;
        Thu, 12 May 2022 00:29:22 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902d3c600b0015e8d4eb2b0sm3139958plb.250.2022.05.12.00.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 00:29:21 -0700 (PDT)
Date: Thu, 12 May 2022 12:59:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qianfanguijin@163.com
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ARM: dts: sun8i-r40: add opp table for cpu
Message-ID: <20220512072919.hkggxbqmovebdych@vireshk-i7>
References: <20220512071858.10805-1-qianfanguijin@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512071858.10805-1-qianfanguijin@163.com>
User-Agent: NeoMutt/20180716-391-311a52

On 12-05-22, 15:18, qianfanguijin@163.com wrote:
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> OPP table value is get from allwinner lichee linux-3.10 kernel driver
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
> Changes in v3:
> - remove "allwinner-r40" compatible from allowlist.
> - split dts in two part.
> 
>  arch/arm/boot/dts/sun8i-r40.dtsi | 47 ++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)

Both the patches can go via SoC tree now. I will not pick them. Thanks.

-- 
viresh
