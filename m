Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D6655E70
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CEF22F4;
	Thu, 21 Dec 2023 08:29:56 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C9393F64C;
	Thu, 21 Dec 2023 08:29:10 -0800 (PST)
Date: Thu, 21 Dec 2023 16:29:07 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: sunxi: sort alphabetically
Message-ID: <20231221162907.1b609235@donnerap.manchester.arm.com>
In-Reply-To: <6721cb2f-4498-4d20-9059-257846005905@linaro.org>
References: <20231221140614.639697-1-andre.przywara@arm.com>
	<ab8e7d68-c09c-47ff-9f31-08b073387403@linaro.org>
	<20231221150714.53d40ea3@donnerap.manchester.arm.com>
	<6721cb2f-4498-4d20-9059-257846005905@linaro.org>
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

On Thu, 21 Dec 2023 16:38:41 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi,

(CC:ing Maxime for potential historic context)

> On 21/12/2023 16:07, Andre Przywara wrote:
> > On Thu, 21 Dec 2023 15:45:17 +0100
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > 
> > Hi,
> >   
> >> On 21/12/2023 15:06, Andre Przywara wrote:  
> >>> The sunxi.yaml file, holding all known board compatible names for
> >>> devices with Allwinner SoCs, is apparently sorted alphabetically, by the
> >>> "description" entry. However there are a few outliers.
> >>>
> >>> Re-order the entries to get a strict alphabetical ordering, so that:
> >>> $ grep description: sunxi.yaml | sort -fc
> >>> returns empty-handed. There is no change otherwise.
> >>>
> >>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>    
> >>
> >> What was the existing order? Aren't this just shuffling again things?  
> > 
> > It assume the intention was to order "alphabetically by description", but
> > there were some out-of-place entries which apparently slipped through
> > review.
> > 
> > Shall I add a comment at the top to note the order?  
> 
> Some files like this are ordered by compatible, some by class or family
> of devices, so first you need to be sure there is no existing order.

That's what I did, of course:
- there is no order in the compatible strings, not in the most specific
name, nor in the fallback names
- new boards have always been added somewhere in the middle, never at the
end, so it's not "oldest boards first"
- the SoCs used in the boards are all over the place, so it's not sorted
by SoC
- I see no rhyme or reason in the board types: we have tablets, devboards,
TV boxes all mixed up happily.

But: from the 197 listed boards, a movement of 13 boards, often by just one
position, makes the list ordered by description.

So I assumed this was the intention, and fixed the list accordingly. Happy
to stand corrected if the maintainers have a better idea.

Cheers,
Andre
