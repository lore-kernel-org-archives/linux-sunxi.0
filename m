Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCD74A8F
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Mar 2022 16:09:53 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id y27-20020a4a9c1b000000b0032129651bb0so1858936ooj.2
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Mar 2022 08:09:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gksQ+ySfVzX/BzWqaFxCpK+7H0a13SWGbxXt2Z5JHuI=;
        b=bUvy/U0EWCccIHn2Lc+Oi/Gz7I1bE+E0GP/R1PKUdG2pDMyIup77KPZYBk3rdC8Qlp
         Thlnprh6FKBLDOEA5VJZ8Wl36LrgAsBL5w5/8i/QK+LdHaKhDtU0+HCk8dzCg7SV5Krr
         owOiLovfmJ+jp9vzLhYsWQKDB8ui0fdFnHhUGKC89DhqnjQPzU6lcaJx05gE/iLyOtdb
         R4s3XD1AyBuxMkgb5jvURkiOREoHgPS+zrmu9Nzzw+b78qEf3YE9VzNlDuLYaKbWWZGZ
         iN59daQUoHZPQfPfpc/l08xXHYAvbXyS/vQgDuyeiveSzC53/jT/d8nwEF4iyRN9552z
         AmYA==
X-Gm-Message-State: AOAM533+SVOKmY20fiNeLCscMggWh1o/3eTZYoV5HGED2lHK6XeEipd3
	aVOWuztF09p0xhKTgZZl2w==
X-Google-Smtp-Source: ABdhPJzLHug0HYSICR5UmoCceM/A96yu7TBizOs7JaMiLXdJSNLB8LT3kVLLyPOnkEYOaS36hCMFTg==
X-Received: by 2002:a05:6870:c588:b0:da:3d88:de58 with SMTP id ba8-20020a056870c58800b000da3d88de58mr2890938oab.32.1646755792766;
        Tue, 08 Mar 2022 08:09:52 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 60-20020a9d0642000000b005b22a82458csm4268370otn.55.2022.03.08.08.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:09:51 -0800 (PST)
Received: (nullmailer pid 849717 invoked by uid 1000);
	Tue, 08 Mar 2022 16:09:50 -0000
Date: Tue, 8 Mar 2022 10:09:50 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, George Hilliard <thirtythreeforty@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Mesih Kilinc <mesihkilinc@gmail.com>, Giulio Benetti <giulio.benetti@benettiengineering.com>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 03/14] dt-bindings: arm: sunxi: document LicheePi Nano
 name
Message-ID: <Yid/zlFb2fqNsKEQ@robh.at.kernel.org>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
 <20220307143421.1106209-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307143421.1106209-4-andre.przywara@arm.com>

On Mon, 07 Mar 2022 14:34:10 +0000, Andre Przywara wrote:
> The top level LicheePi Nano compatible name was never documented in the
> bindings, so add the currently used string.
> 
> It looks like the manufacturer might be "sipeed" as well, but I will go
> with the "licheepi" string that is in the actual .dts for years now.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
