Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B231FA1
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Mar 2023 08:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4781DC433D2;
	Fri,  3 Mar 2023 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677831687;
	bh=SE03lTQiJVZlT7VRK6lSLF33F5PXhg+rkDV1p/sEVYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZc2D5kx6VJ/h6uDllJB8zEANzp8off+IPkF4g344UdNn/EBiMRCP/BST/Rx44KuZ
	 MOIvXVmMcDZVsFZ7ib4CqV1L4mrVj05l75z5z/2/VzIuXIInGx7E6x1Zhc7lmCcSWI
	 qXMurUQqyDG5hI6YKjamE9UOhAkAm28QY9g9v8NbAvHyn3LKXgM0Ypx7HkgOZ7wE9L
	 zsnVGi3M/Kl7ZUiJDFFyAj19HdRc99o6U3QSUu08okHB10hTIZRM3KJM86RqqlF+pi
	 Q+e9uX/tWDN9B6JuivuL/q+/k9Deir7Vf2gAnuofO2t7FLOtaELYWY5u9oO+/JYFME
	 kaabucxiKrxOQ==
Date: Fri, 3 Mar 2023 08:21:22 +0000
From: Lee Jones <lee@kernel.org>
To: ye.xingchen@zte.com.cn
Cc: wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: =?iso-8859-1?Q?sun4i-gpad?=
 =?iso-8859-1?Q?c=3A_use=A0devm=5Fplatform=5Fget=5Fand=5Fioremap=5Fresourc?=
 =?iso-8859-1?B?ZSgp?=
Message-ID: <20230303082122.GF2303077@google.com>
References: <202302081736500534579@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202302081736500534579@zte.com.cn>

On Wed, 08 Feb 2023, ye.xingchen@zte.com.cn wrote:

> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/mfd/sun4i-gpadc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
