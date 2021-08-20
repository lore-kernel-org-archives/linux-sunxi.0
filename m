Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B6F3FC2
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 12:11:25 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id d16so16973788ljq.4
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 05:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=qLfZ8/GKcURSHCm2cP8f/aOHmp3T/NRBIyV2qbqgsho=;
        b=OauSmUV4hal1w9xD78hLWNlHFTpLEps4+Ecawfh9QcyA59w7UfrpMBe3Y3lyQZhLx2
         GRi4kWoqpM9WdxnRVx2m3Onu3xIuSD3ir1CBpcoHdrBAsMhd/C9RTGma7yDJPUHctqvu
         4r0mKKUPXSKLu+N3w7A5qVLR50gTmEdWc5zMz6NdQdBCrRCemJiOUFNPjdO9zI55lgDO
         YghdY4b/vLEG9iMLLbFk4FbcN0cc/FwKbsIKqdsScbWQ8vmBF7KGt4Wu1vsA3a3in5fX
         sNNu2GDVi8XfLdIDh/VjIIXhYucpb9HWFKwROcsIy21qnSNSVpZ7bDiVxEh4lf6TO3BE
         gjBw==
X-Gm-Message-State: AOAM532FCv/PFSRJROEf/lAMbT8oOGqjM3k8vbFYzf3vRmWKvnJlFBtz
	a8dn1au2f7TrFwSYH4c6rB0c+3a5LnzjAw==
X-Google-Smtp-Source: ABdhPJzEUIWzPvnH5GXRakhNc7QuCuf6cMJ+EJcz2SJ9XWlOs3kSxDjL/0X6d0MWACgsCh+ZbryQ9Q==
X-Received: by 2002:a05:651c:490:: with SMTP id s16mr15807184ljc.214.1629461483213;
        Fri, 20 Aug 2021 05:11:23 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id x9sm615294lfa.233.2021.08.20.05.11.22
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 05:11:22 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id f10so5390724lfv.6
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Aug 2021 05:11:22 -0700 (PDT)
X-Received: by 2002:a19:f819:: with SMTP id a25mr14506302lff.203.1629461482247;
 Fri, 20 Aug 2021 05:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210820081645.83796-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210820081645.83796-1-krzysztof.kozlowski@canonical.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 20 Aug 2021 20:11:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v66EnW+iO2CPueauRob+b53pNFEuL6LUoSYb09_TN+=_cw@mail.gmail.com>
Message-ID: <CAGb2v66EnW+iO2CPueauRob+b53pNFEuL6LUoSYb09_TN+=_cw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: h5: align operating-points
 table name with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 20, 2021 at 4:16 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Align the name of operating-points node to dtschema to fix warnings like:
>
>   arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dt.yaml:
>     cpu-opp-table: $nodename:0: 'cpu-opp-table' does not match '^opp-table(-[a-z0-9]+)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi
> index b2657201957e..0b6914a165b0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-cpu-opp.dtsi
> @@ -2,7 +2,7 @@
>  // Copyright (C) 2020 Chen-Yu Tsai <wens@csie.org>
>
>  / {
> -       cpu_opp_table: cpu-opp-table {
> +       cpu_opp_table: opp-table-0 {

Maybe we should just reorder the name? Name it "opp-table-cpu" instead.
That way if and when we add one for the GPU, we don't accidentally
clash on the name.


ChenYu
