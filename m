Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com [91.221.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232792FAF
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Aug 2021 18:22:56 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
	by mx2.smtp.larsendata.com (Halon) with ESMTPS
	id 42771a87-0051-11ec-aa7e-0050568cd888;
	Wed, 18 Aug 2021 18:22:34 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sam@ravnborg.org)
	by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2FDB2194B25;
	Wed, 18 Aug 2021 20:22:56 +0200 (CEST)
Date: Wed, 18 Aug 2021 20:22:43 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
	airlied@linux.ie, daniel@ffwll.ch,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: add vendor prefix for Vivax
Message-ID: <YR1P86H+s3BuLebl@ravnborg.org>
References: <20210818144648.72665-1-pavlica.nikola@gmail.com>
 <20210818144648.72665-3-pavlica.nikola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818144648.72665-3-pavlica.nikola@gmail.com>

On Wed, Aug 18, 2021 at 04:46:48PM +0200, Nikola Pavlica wrote:
> Add vendor prefix for the Vivax brand by M SAN Grupa d.o.o.
> 
> Source (in Croatian): https://www.vivax.com/hr/o-nama.aspx
> 
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I like this as the first in the series, as we cannot apply the patch to
the panel-simple binding before the vendor prefix is present.

	Sam

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index f6064d84a424..c234c392538d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1206,6 +1206,8 @@ patternProperties:
>      description: Vitesse Semiconductor Corporation
>    "^vivante,.*":
>      description: Vivante Corporation
> +  "^vivax,.*":
> +    description: Vivax brand by M SAN Grupa d.o.o.
>    "^vocore,.*":
>      description: VoCore Studio
>    "^voipac,.*":
> -- 
> 2.32.0
