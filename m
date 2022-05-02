Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7D917C1
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 09:06:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id D629B425F5;
	Mon,  2 May 2022 09:05:58 +0000 (UTC)
Message-ID: <8d60761d-178f-2da1-ffac-34a33d6c4669@marcan.st>
Date: Mon, 2 May 2022 18:05:56 +0900
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/7] mailbox: apple: peek_data cleanup and implementation
Content-Language: es-ES
Cc: Anup Patel <anup.patel@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Michal Simek
 <michal.simek@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20220502090225.26478-1-marcan@marcan.st>
To: Jassi Brar <jassisinghbrar@gmail.com>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20220502090225.26478-1-marcan@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/05/2022 18.02, Hector Martin wrote:
> Cc: Anup Patel <anup.patel@broadcom.com>
> Cc: Vinod Koul <vkoul@kernel.org> (maintainer:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM)
> Cc: Sven Peter <sven@svenpeter.dev> (maintainer:ARM/APPLE MACHINE SUPPORT)
> Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io> (reviewer:ARM/APPLE MACHINE SUPPORT)
> To: Jassi Brar <jassisinghbrar@gmail.com> (maintainer:MAILBOX API)

Sigh, why do I always screw up git send-emails...

Jassi: this was supposed to be for you, but I had a spurious newline in
the cover file and that dropped the to: (but not the cc:s). Let me know
if you need the whole thing resent if you didn't get it via lists. My
apologies.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
