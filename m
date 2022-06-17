Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8E17F
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Jun 2022 09:25:21 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1o28Dw-008C24-Gl; Fri, 17 Jun 2022 19:25:06 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 Jun 2022 17:25:04 +0800
Date: Fri, 17 Jun 2022 17:25:04 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] crypto: sun8i-ss - fix infinite loop in
 sun8i_ss_setup_ivs()
Message-ID: <YqxIcHQn+nD+Lsuj@gondor.apana.org.au>
References: <1654885635-32290-1-git-send-email-khoroshilov@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654885635-32290-1-git-send-email-khoroshilov@ispras.ru>

On Fri, Jun 10, 2022 at 09:27:15PM +0300, Alexey Khoroshilov wrote:
> There is no i decrement in while (i >= 0) loop.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
> Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
> ---
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
