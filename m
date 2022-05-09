Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582437B
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 09:31:33 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id x12so11545012pgj.7
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 02:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JpCRaDNZYevpLkY4KOz+K7YSl/uzka5d9oakp3W77tc=;
        b=HCmVcQ84A1B0mzXMIys8FhK9PENXHAKemAfPPPxoXKFdSh1QQXAzaPKVIqUEZLBs3/
         H3pOb5uEAcuA5+F3hsUEogfhE/lRjNABeErSGu86+1ArNxEujpz8rVgWRX6v8tqEHwvx
         0Xqpg/6Ry0GYJyosH55MLUfXrVeFOeBbGMK0uDInQXOaKGgdh2bcfZdABop9RngLLwa+
         byDloH8cGSO4Dgs0GAKgT2GGWD3uNvjIr77nTWojR1RPoerG/QTxBZopGJZ/enkgNXjI
         JKPl1sWprQahCNAmvlKDtaIJKpENBTMrQIA16/z2HPN40vin7eLoO7VkkbrQPSCVNvLk
         7pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JpCRaDNZYevpLkY4KOz+K7YSl/uzka5d9oakp3W77tc=;
        b=haFu+beeCc3XvW8AI2lRsihfUfLS/DrFqXfbqphFf8NKRkcRnwg7rqHpWbgxcURcLm
         CuEZqtXrWAdiCXiLNx8kliHot4tq4rrOk6mp4trO4pC02WL1ky6BAkn/5+mqG78f86ai
         E8LGzHKtINjn9LMc12inrNI7BU1Z3d1zNX3vgTlNHXHo2q3opnBrnXzAAdK1wMgBOlgV
         YoGUR655VuI13BQXtDDBMI/mLUHLRzM1hgWKIRrLuv3UzV7OYp9j9iOYmM8UxRpWvhEC
         QUux1+s7adEHYAw2vDVKhXAYc2pnqkJSZgIs7aHhHxBX/l+eWbX3//Ezu6VhwLKVTAFV
         Yr3Q==
X-Gm-Message-State: AOAM5317b3w/Vj6dQ9ymi0uZ1BbY3lQz0iItj13FWA2LCtp83QF33xJn
	esXVm0eE5Vk9VMCB5M00+UHg0rHQqotU0Q==
X-Google-Smtp-Source: ABdhPJxdD04mCtOjOZoG59KlHgaCvKklPPxlk10wG2ZHb2KCQ4qNWZv9oKioDl7bTyyCDTPNP632lQ==
X-Received: by 2002:a63:ad0c:0:b0:374:50b4:c955 with SMTP id g12-20020a63ad0c000000b0037450b4c955mr12237883pgf.530.1652088692871;
        Mon, 09 May 2022 02:31:32 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id n28-20020a056a000d5c00b0050dc7628148sm8110335pfv.34.2022.05.09.02.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 02:31:32 -0700 (PDT)
Date: Mon, 9 May 2022 15:01:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: qianfanguijin@163.com, linux-sunxi@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1] drivers: cpufreq: sun8i-r40: Add cpufreq support
Message-ID: <20220509093130.jegqpe6m7xtbouqa@vireshk-i7>
References: <20220509084853.17068-1-qianfanguijin@163.com>
 <20220509091125.tps3zwaq276jlgh3@vireshk-i7>
 <20220509092306.22ttfunrislztbvh@houat>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509092306.22ttfunrislztbvh@houat>
User-Agent: NeoMutt/20180716-391-311a52

On 09-05-22, 11:23, Maxime Ripard wrote:
> Hi,
> 
> On Mon, May 09, 2022 at 02:41:25PM +0530, Viresh Kumar wrote:
> > On 09-05-22, 16:48, qianfanguijin@163.com wrote:
> > > From: qianfan Zhao <qianfanguijin@163.com>
> > > 
> > > OPP table value is get from allwinner lichee 3.10 kernel.
> > > 
> > > Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> > > ---
> > >  arch/arm/boot/dts/sun8i-r40.dtsi     | 47 ++++++++++++++++++++++++++++
> > >  drivers/cpufreq/cpufreq-dt-platdev.c |  1 +
> > >  2 files changed, 48 insertions(+)
> > 
> > Applied. Thanks.
> 
> Shouldn't you wait for the maintainers feedback for the DT bits at least?

I should have, will drop it.

-- 
viresh
