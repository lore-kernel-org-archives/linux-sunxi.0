Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401BF2F22
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Feb 2023 22:33:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC34F1042;
	Wed, 15 Feb 2023 14:34:15 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39BF83F881;
	Wed, 15 Feb 2023 14:33:31 -0800 (PST)
Date: Wed, 15 Feb 2023 22:31:23 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>, Bastian Germann
 <bage@debian.org>, linux-remoteproc@vger.kernel.org, Chen-Yu Tsai
 <wens@csie.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland
 <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Ohad Ben-Cohen
 <ohad@wizery.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] Enable hwlock on Allwinner A64
Message-ID: <20230215223123.7ff98ad6@slackpad.lan>
In-Reply-To: <167640821432.1045974.5362172074959635497.b4-ty@kernel.org>
References: <20230213231931.6546-1-bage@debian.org>
	<167640821432.1045974.5362172074959635497.b4-ty@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Feb 2023 12:57:06 -0800
Bjorn Andersson <andersson@kernel.org> wrote:

Hi Bjorn,

> On Tue, 14 Feb 2023 00:19:27 +0100, Bastian Germann wrote:
> > The allwinner,sun6i-a31-hwspinlock compatible driver can be used with
> > the Allwinner A64 chip. Add the wiring required to enable it.
> > 
> > The device tree schema needs some work to verify everything that is
> > needed by the sun6i hwlock driver.
> > 
> > The hwlock device was verified to be available with this series applied
> > on a Pinebook.
> > 
> > [...]  
> 
> Applied, thanks!
> 
> [1/3] dt-bindings: hwlock: sun6i: Add missing #hwlock-cells
>       commit: 25d10262ed8aae71cd2f0b3c0a90d06a6b79fba2

as you might have seen, this was a bit premature, as the example is
missing the newly required property, as pointed out by Rob[1].
Did you send a pull request including this patch already? Can you drop
this patch still from your tree? The fix is rather trivial, but the
patch is also not critical, since there is no DT user in the tree, and
the remaining series won't make it into v6.3 anyway.

Cheers,
Andre

[1]
https://lore.kernel.org/linux-remoteproc/167638944701.3666.5425414440419322569.robh@kernel.org/
