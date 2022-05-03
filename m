Received: from skyrocket.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B507F
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 08:51:06 +0000 (UTC)
Received: from mail.fabmicro.ru (skyrocket.fabmicro.ru [217.116.57.130])
	by skyrocket.fabmicro.ru (8.14.9/8.14.9) with ESMTP id 2438od2O057796;
	Tue, 3 May 2022 08:50:39 GMT
	(envelope-from rz@fabmicro.ru)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 03 May 2022 13:50:39 +0500
From: Ruslan Zalata <rz@fabmicro.ru>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] hwmon: (sun4i-lradc) Add driver for LRADC found on
 Allwinner A13/A20 SoC
In-Reply-To: <20220502110010.q7vvdkdpaiz5acjl@houat>
References: <20220428210906.29527-1-rz@fabmicro.ru>
 <20220502110010.q7vvdkdpaiz5acjl@houat>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <6009fbef45a8b77caa4fc137093a1e23@fabmicro.ru>
X-Sender: rz@fabmicro.ru
Organization: Fabmicro, LLC.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	skyrocket.fabmicro.ru

Hi Maxime,

> I guess a better path forward would be to either register an hwmon
> device in the original driver, or convert that driver to iio and use
> iio-hwmon.

My first idea was to add hwmon to sun4i-lradc-keys.c driver. But soon as 
I began hacking the driver I quickly realized that it would be a mess 
since keyboard and hwmon belong to two different subsystems. Besides we 
would need to invent a way to control which way the driver works (new 
bindings?). So I decided that a new independent small driver would be a 
better solution.

---
Regards,
Ruslan.

Fabmicro, LLC.
