Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB04D7F4
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Feb 2023 05:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001ABC433EF;
	Wed,  1 Feb 2023 05:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675227981;
	bh=P+Y6BhVjqoJ5Ni1WFHr98m4Q8zM9re9BNCni0XisMFY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=io0ooGQx1VxW941ttwpQtsVATXekFk56ZP62uvyzruYzYEW5fFik3ncPWWt9LuOf7
	 nG7DnzL70WODqhx6a/Qpj/MGIIb2ymB0xbxYkHK8Cgav8z4sR12+Grg+4fYr+fkfg5
	 KM4VKXvt2Qn3sAOxGVsXRazGZ3UFPgNqSZVsgUOI=
Date: Wed, 1 Feb 2023 06:06:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Bin Liu <b-liu@ti.com>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
	soc@kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 02/11] usb: musb: sunxi: add support for the F1C100s
 MUSB controller
Message-ID: <Y9nzSm7ZKYVsHA6m@kroah.com>
References: <20230111015332.172021-1-andre.przywara@arm.com>
 <20230111015332.172021-3-andre.przywara@arm.com>
 <20230131225253.04369efc@slackpad.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230131225253.04369efc@slackpad.lan>

On Tue, Jan 31, 2023 at 10:52:53PM +0000, Andre Przywara wrote:
> On Wed, 11 Jan 2023 01:53:23 +0000
> Andre Przywara <andre.przywara@arm.com> wrote:
> 
> Hi Bin, Greg,
> 
> > From: Icenowy Zheng <uwu@icenowy.me>
> > 
> > The suniv SoC has a MUSB controller like the one in A33, but with a SRAM
> > region to be claimed.
> > 
> > Add support for it.
> 
> is there any chance you could take this patch (and the next one,
> ideally) through your tree? And not sure if the binding patch (01/11)
> should also go this way?

Please resend just the patches you want me to apply, picking them out of
an old series is very difficult to do.

thanks,

greg k-h
