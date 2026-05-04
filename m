Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8821F3DD533
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 23:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937646; cv=none; b=WPQokWlpFHq/V5vNazDMotEL+mKA9OwGteB2tH91wmPnRc4PX515oJkwkI93Xk9p9dJDez7D/cBZ2ftDi6tGsyxdRbH6BUZ6pdqAymXAi1mDIG5NorrpSBzBOcrJUMe6wc5Ulk95y9sCUAyJqj9XaHzi5cCaawCQjusQLXz2o9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937646; c=relaxed/simple;
	bh=yRUjHk/bWRa3yzbi/uy35powhSCptlYsurtPe87JWYM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZ/hWuuNC23iuy+0jB9Jv8dzuy95HNO0bDAGH7nyNNaIZeBPB4eJdOKLSmaJurH/fXmmhE/VGrCJYsnLuYEh0ccFltzp0WL4cw34RlEJ4rDYW8PCFZQ43tmy4Wmn2LxJ8fRB9xmm3cj1iq1dyQGF9geC0kLmp3l9ssUl8hTbl88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NIZxlofX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NIZxlofX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E3E924C0;
	Mon,  4 May 2026 16:33:56 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC9AD3F7B4;
	Mon,  4 May 2026 16:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777937641; bh=yRUjHk/bWRa3yzbi/uy35powhSCptlYsurtPe87JWYM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NIZxlofX6t0+2104etadZndVgufTMw9ZvqEMHOclqmJC6gHGx/FJ2GAAgTD4+zcGZ
	 c7N5fov8VNvAdoRfsxzoCJ2vcYepEka6aEq8NeWpLckyyjrz0usTToXaoF3iGpc5Pj
	 w611q2DlRNqSgvTjqeFmoWDEwQ2F9XQ9ghdPNtCg=
Date: Tue, 5 May 2026 01:33:25 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: fix regulator leak in
 sunxi_pmx_request() error path
Message-ID: <20260505013325.74de6c21@ryzen.lan>
In-Reply-To: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
References: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 04 May 2026 22:53:26 +0800
Felix Gu <ustc.gu@gmail.com> wrote:

> In the error path of sunxi_pmx_request(), the code calls
> regulator_put(s_reg->regulator) to release the regulator. However,
> s_reg->regulator is only assigned after a successful regulator_enable().
> This causes a memory leak: the regulator obtained via regulator_get()
> is never properly released when regulator_enable() fails.

Yes, that's a correct observation. The fix looks alright, though I
wonder if we should drop the "goto" here altogether, since there is only
one caller, and the code would look better like this:

	ret = regulator_enable(reg);
	if (ret) {
		dev_err(pctl->dev, ...
		regulator_put(reg);
		return ret;
        }
...

> Fixes: dc1445584177 ("pinctrl: sunxi: Fix and simplify pin bank regulator handling")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Regardless, the fix is correct, so:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> index d3042e0c9712..25489beeb312 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -925,7 +925,7 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
>  	return 0;
>  
>  out:
> -	regulator_put(s_reg->regulator);
> +	regulator_put(reg);
>  
>  	return ret;
>  }
> 
> ---
> base-commit: b9303e6bff706758c167af686b5315ad00233bf8
> change-id: 20260504-sunxi-cda91661c181
> 
> Best regards,

