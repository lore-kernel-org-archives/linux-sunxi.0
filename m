Received: from pmg02-out2.zxcs.nl (pmg02-out2.zxcs.nl [185.104.28.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2241D71
	for <linux-sunxi@lists.linux.dev>; Fri, 30 Apr 2021 16:38:05 +0000 (UTC)
Received: from pmg02.zxcs.nl (localhost.localdomain [127.0.0.1])
	by pmg02.zxcs.nl (ZXCS) with ESMTP id E9C3E82A62;
	Fri, 30 Apr 2021 18:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID
	:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KsXSqY78n88IV4UYE9qwjmB2sIl6oGICtk7uw8Iuo3Y=; b=R5EM6Jh6MInWVEwqtXEJERb7FR
	w6LYU3LIPuPyjSSVq3OxumZcia/Q4lsN21ADe7/asfuyKLRXY8hmwoRW5zdCOtCn+6py5XFKjuafU
	fH6pGOLnwc68GlWZ49fRHTO5qBigWwnuZOASL+oaomB3PaDT0QZ5oCEM/oTl7fokESEZ4xgw9VC89
	vfyNpi2JRtRHTuEvu80Wh4JhCXsaEOqWQpikWFum/lrnquv68y0iKKuq81Mlowp9po6ipdgHFWo1j
	wG4++6HjKIpsHr4elXra3DQeETW/xU/lW53rcZqm5UY9t9IcqWBBUAJuyCXCCOzqKp6C0je0OuSsd
	/7udXDSA==;
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 30 Apr 2021 18:18:27 +0200
From: dev@pascalroeleven.nl
To: roman.beranek@prusa3d.cz
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@siol.net>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-sunxi@googlegroups.com, Roman Beranek <roman.beranek@prusa3d.com>
Subject: Re: [linux-sunxi] Re: [PATCH] pwm: sun4i: Round delay time up to a
 nearest jiffy
In-Reply-To: <CB15JRQIWROB.2MRNYCPGI20C6@zen.local>
References: <CB15JRQIWROB.2MRNYCPGI20C6@zen.local>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6f65c35761a96443532347586494471c@pascalroeleven.nl>
X-Sender: dev@pascalroeleven.nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: dev@pascalroeleven.nl

On 2021-04-30 17:10, Roman Beranek wrote:
> Hello Uwe,
> 
> On Fri Apr 30, 2021 at 11:51 AM CEST, Uwe Kleine-König wrote:
>> If you agree that dropping both delay and clk_disable completely is the
>> right thing, you address both problems and going forward with your patch
>> isn't sensible.
> 
> I had my doubts whether simply clearing the PWMx_EN bit would be enough
> to turn the PWM off but I stand corrected. It does work.
> 
> The added bonusu is that once without the invocations of {u,m}sleep and
> clk_{enable_,disable_un}prepare, the sun4i_pwm_apply function finally
> becomes safe for running in an atomic context.
> 
> I will therefore prepare a new patch and come back some time next week.
> 
> Have a great weekend,
> Roman

Hi Roman,

A while ago others and I have made an attempt at fixing this as well.
Before you continue, I'd like to draw your attention to these previous
attempts. Maybe in the mean time things have changed, maybe they
haven't, but I can definitely tell you that just clearing the enable bit
isn't enough. There is some precise timing involved, hence the delays
are there. Unfortunately to my knowledge, this hasn't been documented
anywhere so it's just trial and error.

Please take a look at this post: https://lkml.org/lkml/2020/3/17/1158

Good luck!

Regards,
Pascal

