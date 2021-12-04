Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44DD68
	for <linux-sunxi@lists.linux.dev>; Sat,  4 Dec 2021 15:23:40 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPSA id A174BC341C0;
	Sat,  4 Dec 2021 15:23:36 +0000 (UTC)
Date: Sat, 4 Dec 2021 15:28:45 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Evgeny Boger <boger@wirenboard.com>, Maxime Ripard <maxime@cerno.tech>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Quentin Schulz
 <foss@0leil.net>, Lars-Peter Clausen <lars@metafoo.de>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai
 <wens@csie.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: document TS voltage in AXP
 PMICs
Message-ID: <20211204152845.78828cfc@jic23-huawei>
In-Reply-To: <YaVd8j4fj69pmsnU@robh.at.kernel.org>
References: <20211118141233.247907-1-boger@wirenboard.com>
	<20211118141233.247907-3-boger@wirenboard.com>
	<YaVd8j4fj69pmsnU@robh.at.kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Nov 2021 17:10:42 -0600
Rob Herring <robh@kernel.org> wrote:

> On Thu, 18 Nov 2021 17:12:33 +0300, Evgeny Boger wrote:
> > Most AXPxxx-based reference designs place a 10k NTC thermistor on a
> > TS pin. axp20x IIO driver now report the voltage of this pin via
> > additional IIO channel. Add new "ts_v" channel to the channel description.
> > 
> > Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> > ---
> >  .../devicetree/bindings/iio/adc/x-powers,axp209-adc.yaml       | 3 +++
> >  1 file changed, 3 insertions(+)
> >   
> 
> Acked-by: Rob Herring <robh@kernel.org>

Given the broader discussion on how to handle the NTC isn't directly
related to these patches and these will be needed for any solution
anyway, applied to the togreg branch of iio.git and pushed out as testing
to let 0-day have first go at breaking things.

Thanks,

Jonathan
