Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFFD23CD
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Aug 2022 11:02:22 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oOzlO-00Cpe4-M5; Fri, 19 Aug 2022 21:02:07 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 19 Aug 2022 19:02:06 +0800
Date: Fri, 19 Aug 2022 19:02:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: cgel.zte@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	ye.xingchen@zte.com.cn, zealci@zte.com.cn
Subject: Re: [PATCH linux-next] crypto: sun8i-ce:using the
 pm_runtime_resume_and_get  to simplify the code
Message-ID: <Yv9trrHQ010I1/EF@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802074820.1648786-1-ye.xingchen@zte.com.cn>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel

cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
> and pm_runtime_put_noidle.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
> drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
