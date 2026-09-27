Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9693CE0BB
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 22:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546405; cv=none; b=B+oO47AvOJ6/Xve9oGC7YxBZPqkfWqhLpmjJp6GNnVEFqbVuIPBbbdrt0ycaLTFyqWfd3W27e1dDIhYqWEYqvjU8OyGfdcfh2CFE0G3aYJEVaEW+4rcls/3wBXd6G8Xbwz9JF8jftWOx1bqdo43soyi9k6YQw7ktM/jJLc7fcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546405; c=relaxed/simple;
	bh=2ChPtfS7fuQ6xmL5pBM0ED+Tz6MNWUwwNmCfWCfm6zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RKXNB97KedQDnrcjmUASnQ7qe997w4ltlYOqvn++0Qhe4TTRzdNKUwRTJ33hzZnccldly0MDW0vPgK0nJyr7BviggDs4MfdtNsHJlMtP20mbbo5VQLc8OZTGVNT2ogFxnEFh+hquAlCSR8eqsxLgXs9vzo6UgrZqCDdDvbX+nAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR4C6Oo5; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR4C6Oo5"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-7f4f0d1779dso2022240a34.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 14:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546396; x=1791151196; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pt1JZ0Xx4dSQpjlcwcv4OrOAetyhY0kdTpc42Knguac=;
        b=cR4C6Oo5/c6BAuZU10j9nt1+jpAToowDMvCSVTsxE6wHGzjIHkNV3ZVh1rS0Gh1ktp
         NaYCM6jer3EtFOBrUdKxk324sNXJCtaxviGOCO/jtozghRz3zWaiQ8NZlHlpCv5n/j3/
         Zmp1/RdIJFg5swGfkojWMXVtkBCvdH0nFql1sqtbyk4imWYSd6E9skYF16s+WXSpYymf
         NsZfXx/IJCOVEmIxX1jLYiR09b9dN7JRZViuceXguDu1gRYHu1lI59cFYY1OWzxW4i/c
         ZeI53V8sRrfElalbamNIcpQshzLt0RJD+EZ0UzQzsRv3M5H9Q8H2YYptP+8CfIS091GH
         G9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546396; x=1791151196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pt1JZ0Xx4dSQpjlcwcv4OrOAetyhY0kdTpc42Knguac=;
        b=JtT+l+oYPG6i6/kZ5wMsu9LUghMO3YoAm0J6dFtEFqhgCllum2rMy9mQmBq+O15ONF
         NP/dXhvEFCu8SBt54rrJ/krsxgrKXHn8nN1NxFTbS7yDujgaqfr7zcl13aziputqHrcU
         KVGBPsD2YzDAmhCHfokrVGec7pHpGHY03iPTF2F33YDu6jT0gkcD5Bng7yyqH2YCxO0m
         70VUaAhE3BqnMGK/lAL+xlTmoP1ZRAhv7ULXWRb4eyCjt+6dwWGMDqhV32tgVXoZWSZ9
         w3F4hNyvNCATEUMRUXsI5bSucYaOUQNWIMyOOLGqmw6L5Y8qEdSIRmY39CLllPeeaLIA
         CfAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzReGFYH8jlxXWSNckX2vzsPCqSeUnzTF8k3++6mGIi4VJseDLgXVGMUBCXLU1f5CXin8vMnAi7gwRdBA==@lists.linux.dev
X-Gm-Message-State: AFuF++kSQ9C5V50eMv3i5T3eQcMKEJnUJ7+rOE+Bs3jAPqCxnF8kM29f
	drTKQwP4UQlqWaIqeQhqeuEf27s+hDNZNJNekA3DwxuOxxeMnLwjlhhr
X-Gm-Gg: AYBFou3oZoFMm6KqsWGqx3DSTMee430SvnKtZOi6TJtMvzscN5CHu/88VcR6utkv03S
	kYDZfaxsPZT5dct50hHsPvOndVbdg0+a9nLA3ISnXHgYouomhDWzu2gp8IT1fwtnv3k/h0HQSWu
	cBJI2tgDUYHFP0CHgrXCF1git7L9x/ZgNCO52ZiSOQjnnhxv6tK6fs/t7WdUOaP2ygS6fzYCmb0
	Pq09YThhpFVgDXhEMq/AFQ6FOsUJaqaDGLm0Q28q/xyMLsHD3z2Q8stb9Tmrs1UtP9+aBFg8gM2
	t3StUkas1RK2BjnSmGmKmmNYZ52/J06eCWssJgTkvL6+JU9XiDqqIjRmu/oE0HYE1/hbxrxuhL/
	UondlGg1jq5NQIa+WHxzrMMVlXswfCP1e+llFbTxfKwfzfJYZ8R13bMvT+63GcZtt1VzdJo4kxp
	EZVlT5grxnAJ4E4qBRrp6kACz+2KcsO5TMHnfN9A7S/UpXxsNedVBzYI8UKnwhdRmAJZeI74Kr7
	2oklJ2tb4scOsG7gV7Qv3cK7TCoAeHvdTYDrCxAEHgXdI31m35mK+uCF1vsxr3VFhLGnAwJ8ADw
	hEl8oB21Mqt8m/fVmX7FPAnKhMJNkT6PWpm+WVth/WZ8qCBI7NxBuu/+f4HmA56y6DDJE7FI9Vq
	iEuhSutJsqiaRhR8hDrxRNxgra7TM0Co=
X-Received: by 2002:a05:6830:6d50:b0:7fa:ac4f:794 with SMTP id 46e09a7af769-81781d93ab0mr13732683a34.16.1790546395901;
        Sun, 27 Sep 2026 14:59:55 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.14.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:59:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:39 -0600
Subject: [PATCH net-next v5 04/19] xsk: freeze deferred pool teardown
 during system sleep
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-4-feec6c14dd06@gmail.com>
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
In-Reply-To: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Yao Zi <me@ziyao.cc>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, Linkui Xiao <xiaolinkui@kylinos.cn>, 
 Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Pool destruction calls the driver under RTNL from system_wq. That queue
is not frozen during system sleep, so ndo_bpf() can run after the device
suspend callback has gated its clocks or after the noirq phase.

Use the freezable workqueue for deferred pool release. Work already
running completes before device suspend, and newly queued destruction
waits until device resume. The pool, UMEM and netdev references remain
owned by the work until then. This does not replace driver error
handling after a failed resume.

Fixes: 1c1efc2af158 ("xsk: Create and free buffer pool independently from umem")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 net/xdp/xsk_buff_pool.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index 9d2d94f1fb75..c58f56f24a9c 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -337,7 +337,10 @@ bool xp_put_pool(struct xsk_buff_pool *pool)
 
 	if (refcount_dec_and_test(&pool->users)) {
 		INIT_WORK(&pool->work, xp_release_deferred);
-		schedule_work(&pool->work);
+		/* Teardown calls ndo_bpf(), which may need powered hardware.
+		 * RTNL alone does not exclude the device's system PM callbacks.
+		 */
+		queue_work(system_freezable_wq, &pool->work);
 		return true;
 	}
 

-- 
2.53.0

