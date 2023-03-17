Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D1079D6
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Mar 2023 22:21:26 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8DE4E40003;
	Fri, 17 Mar 2023 22:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679091684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1H0b+8pt3zecfZdT4Lt4hoL0pnvHKD6pkdBtwNxvW4=;
	b=hJ5LBiF1mKl2oulAqe7KSjjKGLbCZw1yF7Sc+jPyNHe5He6DEIw3OKO36ROWMv3xJfcjfo
	yQCThlu4bNCKzClbHV/hgDnTHhyrKFLaS+hHB+J323GaZC5MRzwfVPIXuRUSswx+m95XT8
	DKzTeZfrJ3u7mRBsHqEsh3Oz2NlZwYVCVhTu+SGSEkkmi8grjOKaNp5eMWNoBUWwAUj9GP
	FZNLslGB024APPJcabeY2gUrfszNDkes8eD4Mgu6Ni9UN+U5gKRZJ4d6lEJ+qb7U0LxBD2
	Uno1kxl1rBW4gEM7nwQw8AEyiymx/Hkcw6k4AwIzeS2jVPBtEYa/oIl/bLQsDA==
Date: Fri, 17 Mar 2023 23:21:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: sun6i: Use of_property_present() for testing DT
 property presence
Message-ID: <167909163830.117471.962092693437106290.b4-ty@bootlin.com>
References: <20230310144736.1547041-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144736.1547041-1-robh@kernel.org>


On Fri, 10 Mar 2023 08:47:36 -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> [...]

Applied, thanks!

[1/1] rtc: sun6i: Use of_property_present() for testing DT property presence
      commit: 4d9890ac9d43d4dfd011110ab96633caa6fa829c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
