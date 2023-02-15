Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D95ED303
	for <linux-sunxi@lists.linux.dev>; Wed, 15 Feb 2023 23:11:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F11131042;
	Wed, 15 Feb 2023 15:12:27 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A9FB3F881;
	Wed, 15 Feb 2023 15:11:43 -0800 (PST)
Date: Wed, 15 Feb 2023 23:09:43 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Bastian Germann <bage@debian.org>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>, Ohad Ben-Cohen
 <ohad@wizery.com>, Bjorn Andersson <andersson@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: hwlock: sun6i: Add #hwlock-cells to
 example
Message-ID: <20230215223813.0a578985@slackpad.lan>
In-Reply-To: <aefc027c-e330-c117-87d2-3ea3023f610e@debian.org>
References: <20230215203711.6293-1-bage@debian.org>
	<20230215203711.6293-3-bage@debian.org>
	<20230215204026.318d4b2d@slackpad.lan>
	<aefc027c-e330-c117-87d2-3ea3023f610e@debian.org>
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

On Wed, 15 Feb 2023 21:43:50 +0100
Bastian Germann <bage@debian.org> wrote:

> Am 15.02.23 um 21:40 schrieb Andre Przywara:
> > On Wed, 15 Feb 2023 21:37:07 +0100
> > Bastian Germann <bage@debian.org> wrote:
> > 
> > Hi,
> >   
> >> The dt-bindings tools will compile the yaml dt examples
> >> and this prevents an error about this node not existing.  
> > 
> > This needs to be part of patch 1/5, otherwise it will break
> > bisecting. Just squash the two patches together.  
> 
> Is this also okay with 1/5 already being applied in linux-next?

The idea of -next is to spot those things before they cause problems. I
don't know if it's already too late, let's see what Bjorn says (see
the other mail).

You could either send a totally separate fix patch (outside of a
series), or a new series with the correct patch. But for now let's wait
how this ends up.

Cheers,
Andre

> 
> > 
> > Cheers,
> > Andre
> >   
> >> Signed-off-by: Bastian Germann <bage@debian.org>
> >> ---
> >>   .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml          | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> >> index 01b1bbb3061f..38478dad8b25 100644
> >> --- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> >> +++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
> >> @@ -48,5 +48,6 @@ examples:
> >>           reg = <0x01c18000 0x1000>;
> >>           clocks = <&ccu CLK_BUS_SPINLOCK>;
> >>           resets = <&ccu RST_BUS_SPINLOCK>;
> >> +        #hwlock-cells = <1>;
> >>       };
> >>   ...  
> >   
> 

