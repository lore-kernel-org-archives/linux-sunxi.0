Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0DD1DA2C
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41A312F4;
	Thu, 21 Dec 2023 07:08:03 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E213D3F64C;
	Thu, 21 Dec 2023 07:07:16 -0800 (PST)
Date: Thu, 21 Dec 2023 15:07:14 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: arm: sunxi: sort alphabetically
Message-ID: <20231221150714.53d40ea3@donnerap.manchester.arm.com>
In-Reply-To: <ab8e7d68-c09c-47ff-9f31-08b073387403@linaro.org>
References: <20231221140614.639697-1-andre.przywara@arm.com>
	<ab8e7d68-c09c-47ff-9f31-08b073387403@linaro.org>
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

On Thu, 21 Dec 2023 15:45:17 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi,

> On 21/12/2023 15:06, Andre Przywara wrote:
> > The sunxi.yaml file, holding all known board compatible names for
> > devices with Allwinner SoCs, is apparently sorted alphabetically, by the
> > "description" entry. However there are a few outliers.
> > 
> > Re-order the entries to get a strict alphabetical ordering, so that:
> > $ grep description: sunxi.yaml | sort -fc
> > returns empty-handed. There is no change otherwise.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>  
> 
> What was the existing order? Aren't this just shuffling again things?

It assume the intention was to order "alphabetically by description", but
there were some out-of-place entries which apparently slipped through
review.

Shall I add a comment at the top to note the order?

Cheers,
Andre
