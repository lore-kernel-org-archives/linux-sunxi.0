Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDB52C80
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Nov 2021 00:30:12 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id b67so21027114qkg.6
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Nov 2021 16:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XVaVA291s9c2a18GIJWxFML/McxidosoIY0RR4fMRJU=;
        b=oHtoaaXJpvOUJaHBDtqz0KK/9u7BdCFKqQ55ipPPQwVf7+eHbdueUVSaoYGuvPU4+Z
         cfUEujmM0KQ8DJvDMSkkBPcoCtolCQdbLZeRCI97695HXp4Wa7ImR+WSnCeeBfoG1UU0
         914MHUS62iwTxpzIsS9EaiRD+z1HOs6sZSvr2cs2jXy4DcEFQv7NfVFnBggQeXrBAAEm
         lh8Iwbw5IWzOl9apbtSX3ul8LViNev2addrgw229kXFxFKpjtPHM7veYaCgEsTx99q7C
         hktAIHq68fGERUhtLDUcUyTkHRCP7KvhUW8oa97TqHiaAZmvLQUKbxT9wzGfrd+Lq7cO
         WgaA==
X-Gm-Message-State: AOAM530gIpec1fFMT+go8ywzCSz6H7fda5k111I+0538EY1/RyPpTErq
	dYMkl61CwjtaOx4Et44ukA==
X-Google-Smtp-Source: ABdhPJy84wZGEQdKqBS96phc3Uxb765yWvE+Hs2XEgt450z1Tp6Rt3ZZ02FYAZdDuRGV/9NJIVTvGw==
X-Received: by 2002:a05:620a:460e:: with SMTP id br14mr27737028qkb.533.1638145811740;
        Sun, 28 Nov 2021 16:30:11 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id u9sm7615754qta.17.2021.11.28.16.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:30:10 -0800 (PST)
Received: (nullmailer pid 2887206 invoked by uid 1000);
	Mon, 29 Nov 2021 00:27:55 -0000
Date: Sun, 28 Nov 2021 18:27:55 -0600
From: Rob Herring <robh@kernel.org>
To: Evgeny Boger <boger@wirenboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/3] dt-bindings: net: support for Allwinner R40 EMAC
 controller
Message-ID: <YaQei9KHvsuS9SGc@robh.at.kernel.org>
References: <20211121195337.230475-1-boger@wirenboard.com>
 <20211121195337.230475-3-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211121195337.230475-3-boger@wirenboard.com>

On Sun, Nov 21, 2021 at 10:53:36PM +0300, Evgeny Boger wrote:
> R40 and A10/A20 share the same EMAC IP.
> However, on R40 the EMAC is gated by default, so reset

asserted rather than gated here too.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> property is required.
> 
> Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> ---
>  .../net/allwinner,sun4i-a10-emac.yaml         | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
