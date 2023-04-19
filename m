Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C8B23A2
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Apr 2023 15:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F423C433EF;
	Wed, 19 Apr 2023 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681919370;
	bh=6BEx8wgaCpg8XmB3hRUKMSTOEy3ZNoEAUnUvTeDGYw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EI37X4dJYvc72ZSriDDOIKM6RPmEssYj7rxwvrIowUvGX8PFIvC2kV91I3TdDGcCj
	 q0S/PBJVv0WmQQoNHUo9WSynhOb10AvpLObg7tpXCJRE0oo3xlA/5CY3oVfKwRREtI
	 /1Jd72IvOCxdXE85gxyq661kbPJ19XGGfm9+f+XyrpdLul/0d4J/aTRqz6yUd6yG14
	 ZL7cvNXiflJqDq3klujdbGC7e0rv69jR0bsnrj0ix/VO8AwlNSNKHaLQ6zo02gZGdL
	 ilDJHPyQfw4wxnb+RZ2a4sSKeDNLk7RGl/TYqfvh3EyhguSybVuM/sCDVAvLM5tk7Y
	 OFpj/a5zG6UmA==
Date: Wed, 19 Apr 2023 16:49:24 +0100
From: Lee Jones <lee@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com,
	Shengyu Qu <wiagn233@outlook.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/3] regulator: axp20x: Add support for AXP313a
 variant
Message-ID: <20230419154924.GB9904@google.com>
References: <20230401001850.4988-1-andre.przywara@arm.com>
 <20230401001850.4988-4-andre.przywara@arm.com>
 <d74c94a6-77d1-41f1-82e4-a046f7935aee@sirena.org.uk>
 <20230414113254.4e0618c5@donnerap.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230414113254.4e0618c5@donnerap.cambridge.arm.com>

On Fri, 14 Apr 2023, Andre Przywara wrote:

> On Thu, 6 Apr 2023 14:49:44 +0100
> Mark Brown <broonie@kernel.org> wrote:
> 
> Hi Mark, Lee,
> 
> > On Sat, Apr 01, 2023 at 01:18:50AM +0100, Andre Przywara wrote:
> > > From: Martin Botka <martin.botka@somainline.org>
> > > 
> > > The AXP313a is your typical I2C controlled PMIC, although in a lighter
> > > fashion compared to the other X-Powers PMICs: it has only three DCDC
> > > rails, three LDOs, and no battery charging support.  
> > 
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> 
> so is there anything Martin and I can do to help this move forward? I
> guess broonie's tag above means that the regulator part is good, so the MFC
> parts can go ahead now?

It's on my list.  Busy time.  Please bear with.

-- 
Lee Jones [李琼斯]
