Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com [91.221.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F772
	for <linux-sunxi@lists.linux.dev>; Sat,  9 Oct 2021 15:03:37 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
	by mx2.smtp.larsendata.com (Halon) with ESMTPS
	id e29a3dcb-2911-11ec-ac3c-0050568cd888;
	Sat, 09 Oct 2021 15:02:13 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sam@ravnborg.org)
	by mail01.mxhotel.dk (Postfix) with ESMTPSA id D1542194BA5;
	Sat,  9 Oct 2021 17:02:12 +0200 (CEST)
Date: Sat, 9 Oct 2021 17:02:23 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nikola Pavlica <pavlica.nikola@gmail.com>
Cc: devicetree@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie,
	daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: add vendor prefix for Vivax
Message-ID: <YWGu//XuQMG3CeKf@ravnborg.org>
References: <20211002202905.509437-1-pavlica.nikola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211002202905.509437-1-pavlica.nikola@gmail.com>

Hi Nikola,

On Sat, Oct 02, 2021 at 10:29:04PM +0200, Nikola Pavlica wrote:
> Add vendor prefix for the Vivax brand by M SAN Grupa d.o.o.
> 
> Source (in Croatian): https://www.vivax.com/hr/o-nama.aspx
> 
> Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>

This and the following patch applied to drm-misc-next.

	Sam

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index a867f7102..1a7d9ca02 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1264,6 +1264,8 @@ patternProperties:
>      description: Vitesse Semiconductor Corporation
>    "^vivante,.*":
>      description: Vivante Corporation
> +  "^vivax,.*":
> +    description: Vivax brand by M SAN Grupa d.o.o.
>    "^vocore,.*":
>      description: VoCore Studio
>    "^voipac,.*":
> -- 
> 2.33.0
