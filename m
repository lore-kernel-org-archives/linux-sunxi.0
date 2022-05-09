Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C637B
	for <linux-sunxi@lists.linux.dev>; Mon,  9 May 2022 09:11:28 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id x23so11713641pff.9
        for <linux-sunxi@lists.linux.dev>; Mon, 09 May 2022 02:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7QpxuoVC9zQ059fU/VCO45VAfx6s8GhPEiX2c3POePM=;
        b=NcDYpNTw04yugULw2lGRPP8uvp5iDaWIg0Cp83izxqM6A+vpvp3r73InUADA5S/+yl
         /bUQgAbVun7lO/SrKqe3BscfTx87KV0KGXXOUtm05SEuQT2T/EzBfyBziD+Ru1pSxYxB
         uRheeODB9N5K98Z+wxZkt75t7PyiIEBycBKZiwdobxmqb20wJMq6/69yPJXXtLYiBUta
         p7NLsTeoh0mDe6rxbNgt23gvteCIu4YTAqeHIQTdeOWvQcu5t3cD5n6Q5aaK/JxJcWrw
         qwQLl3kimsJcId7BZDfqPXNvL/Aw5boIH8aoSWxaIuiyYhEyH5CRxIzACxYLjwd96QS9
         TttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7QpxuoVC9zQ059fU/VCO45VAfx6s8GhPEiX2c3POePM=;
        b=vTlh8v8e52ztFHXuzqsZ18ML2g5sgVKDMF8sx246wKdyqfOv+RDELn6CRAJKe/ITwf
         mIydUeouq7+LilQ+vvsXDpiHIyUoszLGW9hVljCNt8n+PQszygKrsvZ6yxvpmiN2jSfN
         xzTaWASCwDLZub+qbr3mXm/jmCfTMg7et1mQau/XtonqNgCwafxho2lCdXAmbu/DFvb6
         xDScSisn28hQfa8jPLRLTvBT5/sWSQ1peGHv5sg4n3StbVTOCHPnQYqdgrvPxGBEKIsW
         xBepEZMbXyaFR64aw00H1Ej96VVgQ1J2jl3uLdpxEf4BId6jS1kf15ZBlGhiDOnxlSHS
         xoMg==
X-Gm-Message-State: AOAM530zz5R9fBHBwIQPpUjm0Bklkf+4tSPimsF05OWfuWPXqzwtVgUG
	EGTRZwimcLzV26KmDYvo78GLsA==
X-Google-Smtp-Source: ABdhPJxOwO6usL9axVziBSOIzqmZTG8IQH2ceVvogPLS2D4/RbZmODDEy76gkcTU+6D0WXe67qjY/A==
X-Received: by 2002:a63:d43:0:b0:3c1:475e:8341 with SMTP id 3-20020a630d43000000b003c1475e8341mr12236858pgn.533.1652087488293;
        Mon, 09 May 2022 02:11:28 -0700 (PDT)
Received: from localhost ([122.162.234.2])
        by smtp.gmail.com with ESMTPSA id h27-20020a056a00001b00b0050dc76281d7sm8361307pfk.177.2022.05.09.02.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 02:11:27 -0700 (PDT)
Date: Mon, 9 May 2022 14:41:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qianfanguijin@163.com
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v1] drivers: cpufreq: sun8i-r40: Add cpufreq support
Message-ID: <20220509091125.tps3zwaq276jlgh3@vireshk-i7>
References: <20220509084853.17068-1-qianfanguijin@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509084853.17068-1-qianfanguijin@163.com>
User-Agent: NeoMutt/20180716-391-311a52

On 09-05-22, 16:48, qianfanguijin@163.com wrote:
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> OPP table value is get from allwinner lichee 3.10 kernel.
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi     | 47 ++++++++++++++++++++++++++++
>  drivers/cpufreq/cpufreq-dt-platdev.c |  1 +
>  2 files changed, 48 insertions(+)

Applied. Thanks.

-- 
viresh
