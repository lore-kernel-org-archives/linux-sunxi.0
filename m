Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F7A1C36
	for <linux-sunxi@lists.linux.dev>; Fri,  1 Jul 2022 14:09:04 +0000 (UTC)
Received: from [167.98.27.226] (helo=[10.35.4.171])
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1o7Go9-00077s-ML; Fri, 01 Jul 2022 14:35:41 +0100
Message-ID: <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>
Date: Fri, 1 Jul 2022 14:35:41 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH] crypto: flush poison data
Content-Language: en-GB
To: Corentin Labbe <clabbe@baylibre.com>, herbert@gondor.apana.org.au,
 hch@lst.de, heiko@sntech.de
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20220701132735.1594822-1-clabbe@baylibre.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220701132735.1594822-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2022 14:27, Corentin Labbe wrote:
> On my Allwinner D1 nezha, the sun8i-ce fail self-tests due to:
> alg: skcipher: cbc-des3-sun8i-ce encryption overran dst buffer on test vector 0
> 
> In fact the buffer is not overran by device but by the dma_map_single() operation.
> 
> To prevent any corruption of the poisoned data, simply flush them before
> giving the buffer to the tested driver.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> 
> Hello
> 
> I put this patch as RFC, since this behavour happen only on non yet merged RISCV code.
> (Mostly riscv: implement Zicbom-based CMO instructions + the t-head variant)
> 
> Regards
> 
>   crypto/testmgr.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> index c59bd9e07978..187163e2e593 100644
> --- a/crypto/testmgr.c
> +++ b/crypto/testmgr.c
> @@ -19,6 +19,7 @@
>   #include <crypto/aead.h>
>   #include <crypto/hash.h>
>   #include <crypto/skcipher.h>
> +#include <linux/cacheflush.h>
>   #include <linux/err.h>
>   #include <linux/fips.h>
>   #include <linux/module.h>
> @@ -205,6 +206,8 @@ static void testmgr_free_buf(char *buf[XBUFSIZE])
>   static inline void testmgr_poison(void *addr, size_t len)
>   {
>   	memset(addr, TESTMGR_POISON_BYTE, len);
> +	/* Be sure data is written to prevent corruption from some DMA sync */
> +	flush_icache_range((unsigned long)addr, (unsigned long)addr + len);
>   }
>   
>   /* Is the memory region still fully poisoned? */

why are you flushing the instruction cache and not the data-cache?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
