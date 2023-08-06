Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB1328EF
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 13:42:28 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9923833737eso505298566b.3
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Aug 2023 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691329347; x=1691934147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3hZ38/+Ms3F1EqmzJCLkF+L8JHXcF7YJ7LY4cDwFEg=;
        b=SPzBm1YdBbtvTEIV1JOBdfR6CA0fgKzXZBB3wpp0DTUZhu9WgsbenYO9PqwDRLMJ+r
         jUk0+YHw+cvFBmxegiMNcXHMYOF0LhZdlj6PZMaO4b+GigEkBr/CTDrEdhkFkMIXspFH
         Ip1Loq5vDqKtT3Ze61BeOgsI1D43+YqY24LuqlLCs8Ovyp6p0DUE82gIDFRkDVCQyKaD
         PXV33GqvZvHkcbEzFA76iGfYKNP5/0TrzUXLyH9s1B2LkUdwYsenlOCyMqsdTg1C/3eS
         50Dwcfc8SbUpIPHleSHvIrasQoEzn/daEwOdElNh7dh8eAFugS7Z0Vrb1uve3j4xwfvA
         kGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691329347; x=1691934147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3hZ38/+Ms3F1EqmzJCLkF+L8JHXcF7YJ7LY4cDwFEg=;
        b=jnltfRK1Zk+/BAm+t3OgecmI8w8RNmbgk95DTRVe4AMSUcDuh8nDdWdaGx7A/oz7qV
         og4wEwqPm/697joUiC/U0A7uTvLyFU4tnu034C0ETXIiuHVqGUiR+P2E7/A7qkjBYhC7
         ibIkD6F0hMHj21RzV9nBYsEsccoFKH153nDAZ57rIGYB0B8wngGvk1dNtoBWR1AxYtez
         M3fgUOGuwDg1IrBZtGpBx9/R5VtHBeJKF7+LxhvFkPVElcvAvD9CmJrEXR95kPWxqR4V
         imMdb0fO6r3KeWCVHZYWwMwZITMqwBJjfgQMYrKwTl7/nG2L7YCFNIcJ7FEPkxg0djAq
         /zlA==
X-Gm-Message-State: AOJu0YwXtBh7HoEsr5ikjJc7xLGrNrM/pXK2h0QZxniSr/nYqiigOihL
	fmlcnzfJCaq3qxwz4CEMW6k=
X-Google-Smtp-Source: AGHT+IFW16CLtR9BgIINux3nrolh4qCbKVx72XAqj9WGF2HfXwD3FMUWnvNuC60k/R3N18kMvhM8Qg==
X-Received: by 2002:a17:906:9bdb:b0:987:5761:2868 with SMTP id de27-20020a1709069bdb00b0098757612868mr5498868ejc.11.1691329346257;
        Sun, 06 Aug 2023 06:42:26 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id oz13-20020a170906cd0d00b00992b71d8f19sm1357934ejb.133.2023.08.06.06.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 06:42:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>,
 Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v5 08/11] clk: sunxi-ng: mux: Support finding closest rate
Date: Sun, 06 Aug 2023 15:42:24 +0200
Message-ID: <4283806.ejJDZkT8p0@jernej-laptop>
In-Reply-To:
 <20230806-pll-mipi_set_rate_parent-v5-8-db4f5ca33fc3@oltmanns.dev>
References:
 <20230806-pll-mipi_set_rate_parent-v5-0-db4f5ca33fc3@oltmanns.dev>
 <20230806-pll-mipi_set_rate_parent-v5-8-db4f5ca33fc3@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. avgust 2023 ob 15:06:53 CEST je Frank Oltmanns napisal(a):
> When finding the best rate for a mux clock, consider rates that are
> higher than the requested rate when CCU_FEATURE_ROUND_CLOSEST is used.
> Furthermore, introduce an initialization macro that sets this flag.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_mux.c | 13 ++++++++++++-
>  drivers/clk/sunxi-ng/ccu_mux.h | 38 +++++++++++++++++++++++++++-----------
>  2 files changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
> index 3ca695439620..5edc63b46651 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -242,6 +242,17 @@ static int ccu_mux_set_parent(struct clk_hw *hw, u8
> index) return ccu_mux_helper_set_parent(&cm->common, &cm->mux, index);
>  }
> 
> +static int ccu_mux_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct ccu_mux *cm = hw_to_ccu_mux(hw);
> +
> +	if (cm->common.features & CCU_FEATURE_CLOSEST_RATE)
> +		return clk_mux_determine_rate_flags(hw, req, 
CLK_MUX_ROUND_CLOSEST);
> +
> +	return clk_mux_determine_rate_flags(hw, req, 0);
> +}
> +
>  static unsigned long ccu_mux_recalc_rate(struct clk_hw *hw,
>  					 unsigned long 
parent_rate)
>  {
> @@ -259,7 +270,7 @@ const struct clk_ops ccu_mux_ops = {
>  	.get_parent	= ccu_mux_get_parent,
>  	.set_parent	= ccu_mux_set_parent,
> 
> -	.determine_rate	= __clk_mux_determine_rate,
> +	.determine_rate	= ccu_mux_determine_rate,
>  	.recalc_rate	= ccu_mux_recalc_rate,
>  };
>  EXPORT_SYMBOL_NS_GPL(ccu_mux_ops, SUNXI_CCU);
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
> index 2c1811a445b0..eb1172ebbd94 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.h
> +++ b/drivers/clk/sunxi-ng/ccu_mux.h
> @@ -46,20 +46,36 @@ struct ccu_mux {
>  	struct ccu_common	common;
>  };
> 
> +#define SUNXI_CCU_MUX_TABLE_WITH_GATE_FEAT(_struct, _name, _parents,
> _table,	\ +				     _reg, _shift, 
_width, _gate,		\
> +				     _flags, _features)		
		\
> +	struct ccu_mux _struct = {					
	\
> +		.enable	= _gate,				
		\
> +		.mux	= _SUNXI_CCU_MUX_TABLE(_shift, _width, 
_table),		\
> +		.common	= {					
		\
> +			.reg		= _reg,			
		\
> +			.hw.init	= CLK_HW_INIT_PARENTS(_name,	
	\
> +							      
_parents,		\
> +							      
&ccu_mux_ops,	\
> +							      
_flags),		\
> +			.features	= _features,			
	\
> +		}						
		\
> +	}
> +
> +#define SUNXI_CCU_MUX_TABLE_WITH_GATE_CLOSEST(_struct, _name, _parents,	
\
> +					      _table, _reg, 
_shift,	\
> +					      _width, _gate, 
_flags)	\
> +	SUNXI_CCU_MUX_TABLE_WITH_GATE_FEAT(_struct, _name, _parents,	
\
> +					   _table, _reg, 
_shift,	\
> +					   _width, _gate, 
_flags,	\
> +					   
CCU_FEATURE_CLOSEST_RATE)
> +
>  #define SUNXI_CCU_MUX_TABLE_WITH_GATE(_struct, _name, _parents, _table,	
\
>  				     _reg, _shift, _width, _gate,	
\
>  				     _flags)			
	\
> -	struct ccu_mux _struct = {					
\
> -		.enable	= _gate,				
	\
> -		.mux	= _SUNXI_CCU_MUX_TABLE(_shift, _width, 
_table),	\
> -		.common	= {					
	\
> -			.reg		= _reg,		
		\
> -			.hw.init	= CLK_HW_INIT_PARENTS(_name,	
\
> -							      
_parents, \
> -							      
&ccu_mux_ops, \
> -							      
_flags),	\
> -		}						
	\
> -	}
> +	SUNXI_CCU_MUX_TABLE_WITH_GATE_FEAT(_struct, _name, _parents,	
\
> +					   _table, _reg, 
_shift,	\
> +					   _width, _gate, 
_flags, 0)
> 
>  #define SUNXI_CCU_MUX_WITH_GATE(_struct, _name, _parents, _reg,		
\
>  				_shift, _width, _gate, _flags)	
	\




