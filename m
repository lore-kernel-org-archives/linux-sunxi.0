Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0528EF
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Aug 2023 13:31:08 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b9cdbf682eso56099481fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Aug 2023 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691328667; x=1691933467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlHmBq49GaYoGsKWVnEVQtnIfJo6/Tl7AXvPxirTIGM=;
        b=aP9mO/RNoYrqvsVxNFMzVI5mJiIVtMZExIyHdSGTl+xTOp5qP40sGCS1cHkaIGHPlq
         iTNUmdWGHuMPb2tx8h4jEKouQ1bTPFdCczcS2ANtf+lmF8ji2zYQNModkrNOKU/oESl+
         zpaBOYOvWZ7evPf0UP8A8nrzRFYE+Spf5XdKSmGH1jBQj26d5REXl9tCUaE5h0ER0dNk
         7RJaYpPjvkCbv/XnejkZNtk3UUsWkpO1m6gYp2ZMBidYXJnNV+BOG/fy9fr5IIW/zJha
         2hCJdKQcWGbln0rnzjZie9B92sytoutlpX1F9Fr8CX7JKJrCPnMOZJj+K8q0e3Rkg0qM
         8wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691328667; x=1691933467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlHmBq49GaYoGsKWVnEVQtnIfJo6/Tl7AXvPxirTIGM=;
        b=gMYSCchOIQ6A+qL0tr8dUI35+hX5KTWzpsTIe6baL1M/qP81vX/nx5zojV+h647YIa
         Q/IaIManZoM2A3ugzvWINj/Ku/TxZTBlcbBa0YnRmpwBIajyGoz6FddYAAxoOkUKfRjG
         KBbrbqVlQOz3zl6NOmsKeIRdN1gU6sO+l77Ez1BjTMBCVTSXVxANf2chmDFoiT01jrBW
         npot0EIG7lGrjrdJNtkuOt6r+jBZS9vVLttDkDOowPMRRVJeics+bUnaU6Msf9vHmVaR
         wAt0JFGvjqBeP3BGiI+wEZVIXT6ada9BJk56ts3SijoE8VxOG6wQyNT7/ralTuTEyUEm
         q+vg==
X-Gm-Message-State: AOJu0YwVTmmnwOJGti5fSCS+1KbxgR7rUkH2H7Lhd76ObRTmUAh7N3uR
	PskuY/74LpMX9aZOAgprdkw=
X-Google-Smtp-Source: AGHT+IGHmqd8RJE7eo0lPAWvv9e9ziWq0pJssJdhZwTmZ/sfB+1bkU9IRB/JQy5FEcgcRYO//Z0Fyw==
X-Received: by 2002:a2e:8195:0:b0:2b9:40c7:f5ed with SMTP id e21-20020a2e8195000000b002b940c7f5edmr4421264ljg.17.1691328666485;
        Sun, 06 Aug 2023 06:31:06 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id la1-20020a170906ad8100b0099b5a71b0bfsm3914500ejb.94.2023.08.06.06.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 06:31:06 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Roman Beranek <me@crly.cz>,
 Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject:
 Re: [PATCH v5 01/11] clk: sunxi-ng: nkm: Use correct parameter name for
 parent HW
Date: Sun, 06 Aug 2023 15:31:04 +0200
Message-ID: <21967267.EfDdHjke4D@jernej-laptop>
In-Reply-To:
 <20230806-pll-mipi_set_rate_parent-v5-1-db4f5ca33fc3@oltmanns.dev>
References:
 <20230806-pll-mipi_set_rate_parent-v5-0-db4f5ca33fc3@oltmanns.dev>
 <20230806-pll-mipi_set_rate_parent-v5-1-db4f5ca33fc3@oltmanns.dev>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. avgust 2023 ob 15:06:46 CEST je Frank Oltmanns napisal(a):
> ccu_nkm_round_rate() takes a clk_hw as parameter "hw". Since "hw" is the
> nkm clock's parent clk_hw, not the clk_hw of the nkm clock itself,
> change the parameter name to "parent_hw" to make it more clear what
> we're dealing with.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_nkm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> index a0978a50edae..f267142e58b3 100644
> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> @@ -106,7 +106,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_hw
> *hw, }
> 
>  static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
> -					struct clk_hw *hw,
> +					struct clk_hw 
*parent_hw,
>  					unsigned long 
*parent_rate,
>  					unsigned long rate,
>  					void *data)




