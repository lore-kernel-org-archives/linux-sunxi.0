Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D204435A;
	Mon, 28 Mar 2022 11:55:04 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c62so16592379edf.5;
        Mon, 28 Mar 2022 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VBA2TVvDQq46dU+vDSFsKIjMbNiJuAyL+n01cA7mLg0=;
        b=OBOwZMzgqbA4Bri1W+TQyb45lBR8NViCvJYDlk5rJZKcVaCgWCV40Bf7Mv/7s4LQTo
         o61uoNoV320FDfTmAXy0OyXXsM6xbZnily3YKTr/Pe7gWFLFh2fymA9CCUGhWiDEZlLZ
         nNwep3nx1H6RuXTTVxqC1Ux9vx68yHHOYmvP8HexVe79FWRO9Iu3fNpeAYkfW2JkM+Vt
         qrh2k9qqmA2fYydHCfMeMdCIwVVoaxO4gxjQE8JAPqhrWkQW+6YiB4qavu4HrF1R3jtl
         KNxBJkSRciGcZ0Vf/9M87/6ctraLnA19Hi8Jr/TqhQEfd0ot10wekX5HmOo9zLRLpGu/
         NhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VBA2TVvDQq46dU+vDSFsKIjMbNiJuAyL+n01cA7mLg0=;
        b=zaZQx1PH4FHaSrlZmX3FvVArkTUxieY0MySlDOJYI2qBXRluvk8OOF6/wDPwbEioKl
         5RzRbusBo2ikeXhRPcPln5TuhYLnYXfSYiGubznF0g90Zc9wHfXawYedH4vihb/9Tgkj
         2enpj6vlTIYchPW+uI4lo6yiYC0aeRDM/rVgfHFWpc8Mllc9bnUU9iV/3qe77IztlDAf
         quPiepML45K5U/5T5BxXT9NvlgUXl8eQWMlqqSms5+knWpnH+RAgYIYtSAnw8FtPQ9da
         ahz+Jh+65WKk5kdcnb+abZc+MkQMmyKIvCfuCa5T8HMELr8VFET31N3V5HEghwxN9t8N
         PFfA==
X-Gm-Message-State: AOAM533NNE6hGiqe60IKQazLmWkjSyEd7S72wOFd+pQBAFbAJ4cL6Qk7
	PnRsbe4dOF+jCR1av7xND84=
X-Google-Smtp-Source: ABdhPJxl9m+FiC/OJjd+DqfT2L64nZ1Oy+3md9ABQHlV5EJnd26lo+025HjOApFZeOymI3r2eMPv3w==
X-Received: by 2002:a05:6402:1718:b0:419:564:6b62 with SMTP id y24-20020a056402171800b0041905646b62mr15482099edu.361.1648468502610;
        Mon, 28 Mar 2022 04:55:02 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it. [93.42.69.170])
        by smtp.gmail.com with ESMTPSA id nb6-20020a1709071c8600b006e02910f818sm5859904ejc.157.2022.03.28.04.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 04:55:02 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:55:01 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	linux-arm-kernel <linux-arm-kernel@axis.com>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"kernel@dh-electronics.com" <kernel@dh-electronics.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-oxnas@groups.io" <linux-oxnas@groups.io>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-unisoc@lists.infradead.org" <linux-unisoc@lists.infradead.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
Message-ID: <YkGiFa9DSKpsSZou@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <20220328082858.GJ7371@axis.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328082858.GJ7371@axis.com>

On Mon, Mar 28, 2022 at 10:28:58AM +0200, Jesper Nilsson wrote:
> Hi Ansuel,
> 
> On Mon, Mar 28, 2022 at 02:09:15AM +0200, Ansuel Smith wrote:
> > - Categorize every dts in arm directory in subdirectory
> > - Fix Makefile to address for the arm subdirectory
> > - Fix any arm64 dependency
> > [...]
> >  arch/arm/boot/dts/axix/Makefile               |    3 +
> >  .../boot/dts/{ => axix}/artpec6-devboard.dts  |    0
> >  arch/arm/boot/dts/{ => axix}/artpec6.dtsi     |    0
> 
> All ARTPEC platforms should be in a directory called "axis".
> Otherwise LGTM.
> 
> Thanks!
> 
> /^JN - Jesper Nilsson
> -- 
>                Jesper Nilsson -- jesper.nilsson@axis.com

Will do the change! Noted.

-- 
	Ansuel
