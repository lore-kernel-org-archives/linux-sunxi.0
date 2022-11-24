Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0AB2F26
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Nov 2022 17:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00263C433D6;
	Thu, 24 Nov 2022 17:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669312174;
	bh=+FlFXwA4BT9cnPk5H4M42/t77aWGGWs13a3QcCxdhAU=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=HX106bVOpI00gL+UDHyqzoeKh/YIHr6tVqdWw5kdo+sapaeEkwpEh+QMvICfLeMw7
	 AjrjYX5g9YY+sSrOcHQV64rrYcBLRagbdwHU+euW+vq+z9CkuDj/qdGS8sl2pVlG8p
	 s7gylWCf/RnKo02TbtUWAqouum4KKYUGjZ4vtbpSK9BlPfT1tjCu/1iPnqzk+axtpa
	 +B80e6kO3v6bn8n4/SqzYyTsOBPFfeuOFG4dD35Svo5oZUEF/Q3uCTfYsoGx2x2NNQ
	 n/dLetgLsW4SGHKVj+6adqiuk+eVUmyciskZjnIrOhUUgxW2CwaBzXvPXfTckVOnvB
	 1ZSrNdJ0jVIrg==
Date: Thu, 24 Nov 2022 23:19:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Icenowy Zheng <uwu@icenowy.me>, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on
 F1C100s SoC
Message-ID: <Y3+uqtNe/tafRwp2@matsya>
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-4-andre.przywara@arm.com>
 <Y2ypy0CM8rJGu2g4@matsya>
 <4438485.LvFx2qVVIh@jernej-laptop>
 <52920a00-8e29-f7f4-0cbd-ceb638ded970@linaro.org>
 <20221115104426.20728ba5@donnerap.cambridge.arm.com>
 <4516dcfb-b928-d454-18a6-bd725f39cc24@linaro.org>
 <20221115161917.328ec91a@donnerap.cambridge.arm.com>
 <e861e62f-4148-b867-0155-e71b1cee0b81@linaro.org>
 <20221115175708.3e69dcd8@donnerap.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221115175708.3e69dcd8@donnerap.cambridge.arm.com>

On 15-11-22, 17:57, Andre Przywara wrote:
> On Tue, 15 Nov 2022 17:29:09 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> Hi,
> 
> > On 15/11/2022 17:19, Andre Przywara wrote:
> > > On Tue, 15 Nov 2022 16:00:54 +0100
> > > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > > 
> > > Hi,
> > >   
> > >> On 15/11/2022 11:44, Andre Przywara wrote:  
> > >>> On Tue, 15 Nov 2022 11:03:24 +0100
> > >>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > >>>
> > >>> Hi,
> > >>>     
> > >>>> On 15/11/2022 07:01, Jernej Škrabec wrote:    
> > >>>>> Dne četrtek, 10. november 2022 ob 08:35:39 CET je Vinod Koul napisal(a):      
> > >>>>>> On 06-11-22, 15:48, Andre Przywara wrote:      
> > >>>>>>> From: Icenowy Zheng <uwu@icenowy.me>
> > >>>>>>>
> > >>>>>>> The F1C100s SoC has one USB OTG port connected to a MUSB controller.
> > >>>>>>>
> > >>>>>>> Add support for its USB PHY.      
> > >>>>>>
> > >>>>>> This does not apply for me, please rebase and resend
> > >>>>>>
> > >>>>>> Also, consider splitting phy patches from this. I dont think there is
> > >>>>>> any dependency      
> > >>>>>
> > >>>>> DT patches in this series depend on functionality added here.
> > >>>>>       
> > >>>>
> > >>>> DTS always goes separately from driver changes because it is a hardware
> > >>>> description. Depending on driver means you have potential ABI break, so
> > >>>> it is already a warning sign.    
> > >>>
> > >>> We understand that ;-)
> > >>> What Jernej meant was that the DTS patches at the end depend on patch
> > >>> 01/10, which adds to the PHY binding doc. I am not sure if Vinod's
> > >>> suggestion was about splitting off 01/10, 03/10, and 10/10, or just the
> > >>> two latter which touch the driver.
> > >>>
> > >>> I can split off 03/10 and 10/10, rebased on top of linux-phy.git/next, and
> > >>> send that to Vinod.
> > >>> Then I would keep 01/10 in a respin of this series here, to satisfy the
> > >>> dependency of the later DTS patches, and Vinod can pick that one patch from
> > >>> there?    
> > >>
> > >> There is no hard dependency of DTS on bindings. You can split these (and
> > >> some maintainers prefer that way) and in DTS patches just provide the
> > >> link to the bindings, saying it is in progress.  
> > > 
> > > But that breaks "make dtbs_check", doesn't it?  
> > 
> > The check will be broken anyway because binding goes via driver
> > subsystem and DTS goes via arm-soc.
> > 
> > If both make to the linux-next and next release, then it's not a problem.
> > 
> > > 
> > > I would think that the DT bits - bindings first, then DTS files using it -
> > > should be bundled. This is how I imagine the future(TM), where DTs and
> > > bindings live outside the kernel repo.  
> > 
> > Yes, that's preferred. Therefore in DTS patch you say the binding is not
> > merged and it is here - lore link.
> > 
> > >   
> > >> The bindings should be however kept with driver changes as it goes the
> > >> same way.  
> > > 
> > > I understand that the bindings describe the contract the driver acts on,
> > > but going forward I think driver changes would need to come later, then
> > > (since they will live in a separate repo at some day)?
> > > Maybe pointing to the binding changes in progress?  
> > 
> > Later as one commit later - yes. Later as other option - not really, why?
> > 
> > > So with a separate repo we would actually need to upstream just the
> > > bindings first, then could push driver changes and .dts files
> > > independently?  
> > 
> > There is no separate repo, so we talk about Linux case now.
> > 
> > > And for now it looks like we are stuck with putting everything in one
> > > series, to make both checkpatch and dtbs_check happy.  
> > 
> > You should rather make maintainers happy :) and here one asked to split.
> 
> Well, he asked to split off the USB PHY patches from the rest of the
> series, since there is some conflict with the recently merged H616 USB PHY
> patches. It is still unclear to me whether this split includes the binding
> patch, or just the two patches touching the actual code.

That mean split off USB phy and binding patches from rest and send for
review

DTS or anything else should not be part of that

-- 
~Vinod
