Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AA52564
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Apr 2023 16:39:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D3B21042;
	Wed, 19 Apr 2023 09:40:30 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 409CE3F5A1;
	Wed, 19 Apr 2023 09:39:45 -0700 (PDT)
Date: Wed, 19 Apr 2023 17:39:42 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Martin Botka <martin.botka@somainline.org>,
 martin.botka1@gmail.com, Shengyu Qu <wiagn233@outlook.com>, Samuel Holland
 <samuel@sholland.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/3] regulator: axp20x: Add support for AXP313a
 variant
Message-ID: <20230419173942.554c2d28@donnerap.cambridge.arm.com>
In-Reply-To: <20230419154924.GB9904@google.com>
References: <20230401001850.4988-1-andre.przywara@arm.com>
	<20230401001850.4988-4-andre.przywara@arm.com>
	<d74c94a6-77d1-41f1-82e4-a046f7935aee@sirena.org.uk>
	<20230414113254.4e0618c5@donnerap.cambridge.arm.com>
	<20230419154924.GB9904@google.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Apr 2023 16:49:24 +0100
Lee Jones <lee@kernel.org> wrote:

Hi Lee,

> On Fri, 14 Apr 2023, Andre Przywara wrote:
> 
> > On Thu, 6 Apr 2023 14:49:44 +0100
> > Mark Brown <broonie@kernel.org> wrote:
> > 
> > Hi Mark, Lee,
> > 
> > > On Sat, Apr 01, 2023 at 01:18:50AM +0100, Andre Przywara wrote:
> > > > From: Martin Botka <martin.botka@somainline.org>
> > > > 
> > > > The AXP313a is your typical I2C controlled PMIC, although in a lighter
> > > > fashion compared to the other X-Powers PMICs: it has only three DCDC
> > > > rails, three LDOs, and no battery charging support.  
> > > 
> > > Reviewed-by: Mark Brown <broonie@kernel.org>
> > 
> > so is there anything Martin and I can do to help this move forward? I
> > guess broonie's tag above means that the regulator part is good, so the MFC
> > parts can go ahead now?
> 
> It's on my list.  Busy time.  Please bear with.

Thanks, and no worries, just wanted to avoid it falling through the cracks!

Cheers,
Andre
