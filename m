Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7457070
	for <linux-sunxi@lists.linux.dev>; Tue, 18 May 2021 01:29:09 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id j75so8239183oih.10
        for <linux-sunxi@lists.linux.dev>; Mon, 17 May 2021 18:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G5rlvH5ctDOjiEvtgp0QPj5NTMf+LJJxdap62IYZ7rc=;
        b=bZP2J5HpqsSxcW4Rr9XbW13MRxD61SymtlSLORtQwSUy/cPBMzftsaK8i5LrlDnom1
         AxEdoU21/8Yz9ADUZXArmEjC7W1tuK0EHZOC29Y2JncXFxCkG+67Oo3QY/enCcGBrI1m
         okvK7tJbCLY6IEu64QMIT6GcFMd70MiuqqEBTg6pX+8guQ/D3rfs9EhnIrETcteTUcNU
         6YnZHbrlV1y67S+DuKILAwWCdepxywRpELW+sRAV9zXK5ZxzKL5iusrH/EbJs6Dd5QVV
         7cHweD0pW0HTuUFDwVNAbxwHXbdc/cDPHpAHZZHFTWENp4F9NGx9VuPYP84ZoQvv5/ka
         W/jQ==
X-Gm-Message-State: AOAM532QSgMuOYADNtzuEnCLj9J7kzTD0qZnSRWRpr641YaJ3sFJ0o1b
	6R3HIOauu19TNviX0b7C8Q==
X-Google-Smtp-Source: ABdhPJxu5sCBoppCrV1nenGEOaEw/iO0i1K0SwPC+mMOngSMEQKGgJoq2mqtZkwnXVi87nKERpCbZg==
X-Received: by 2002:a54:4104:: with SMTP id l4mr2023654oic.48.1621301348704;
        Mon, 17 May 2021 18:29:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c13sm3511147oto.18.2021.05.17.18.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:29:07 -0700 (PDT)
Received: (nullmailer pid 3602690 invoked by uid 1000);
	Tue, 18 May 2021 01:29:06 -0000
Date: Mon, 17 May 2021 20:29:06 -0500
From: Rob Herring <robh@kernel.org>
To: Tobias Schramm <t.schramm@manjaro.org>
Cc: linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 4/7] ASoC: dt-bindings: sun8i-a23-codec-analog: add
 compatible for Allwinner V3
Message-ID: <20210518012906.GA3602631@robh.at.kernel.org>
References: <20210514134405.2097464-1-t.schramm@manjaro.org>
 <20210514134405.2097464-5-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514134405.2097464-5-t.schramm@manjaro.org>

On Fri, 14 May 2021 15:44:02 +0200, Tobias Schramm wrote:
> The analog codec frontend of the Allwinner V3 is compatible with the
> analog codec frontend used on the Allwinner H3.
> This patch adds a compatible string for the analog codec frontend on the
> Allwinner V3 SoC.
> 
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  .../bindings/sound/allwinner,sun8i-a23-codec-analog.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
