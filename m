Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892311;
	b=0j1CmS8BG0qD2yM9mhx+qhlxizjcoGl9slR+uU8Zj6nlPAZpxDlOrWPrU2OMYCEqKrtw
	 gTTEZKR1ZzL62BkPYIveoJTyprscoXYgpfvctEQMah+VkgTUPHRBZhcAoq2U1TVv+7L3q
	 filaWZ6vDYmiw5BsZP5H00NOR4UlREWm9FYr4ioMQeSZ6mRH0EDaVFfJeZmoAfdxziGBq
	 tb3MfB26Md4jYy1gxFt6guQuhpt2IThYh/P3fgfOXVWpfU2nTholLXMWA2F+bJ6lsxDws
	 Rg1TyizNma26YQgXkOxwHArHegU2R7nu7CFshpf5dDZZEdzfZce/DShZrmFyCqKZbaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cFIGFgrqmh7vJ8p05TfgpCv8oubT+IqY4VjNLXb1IxQ=;
	b=FvIkc2Y0GwdRUQGy+DtYsNAX+d/38QzjlrqYN28r/Glf/WzXomlh3Eq7DDPB7NHD6+XP
	 CD581z+0dowlvKgPfooE6/o+6cFW2ITvb6ZDdo8Oz+PVaqDn9Ew339NVhMzCvpZfkXuLM
	 Fo53dKLYIXbCoS604n/+EaSX1rkRtm/n9kMk2a2f0nPhq8CnKRBPU+1CRFm+yQ0xA2JYc
	 BfkJ8zmyNJ1eDKBGCDgeYPtGPrO/gBoU7LBoPw6jqG0N1gx1hSEnbGf3OO9SaqVP1aQGT
	 vox9WzU3jIUmMrmfP+IGajQceWcVdSrpX96M80BPNhBxJZw+QmsPqfS6oq/Hik89ahA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoB0OCST;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BE8606A329
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 05:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1BE8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoB0OCST
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so4858713c88.1
        for <linux-sunxi@lists.linux.dev>; Mon, 16 Nov 2026 21:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794892310; x=1795497110; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFIGFgrqmh7vJ8p05TfgpCv8oubT+IqY4VjNLXb1IxQ=;
        b=QoB0OCSTUCiwhiTFm7AFgszuy5bWdV1Dez86Vzd08rZSyDhAsM4eFklUBDIUPw96Ta
         8xJ0wtaD5ov8QiUHv3liX98JyxbLLjPzcXSs4Ode7MfTRrfF4+c9Ur7nWJdLeBMM+FYX
         DnbKTS0nJYLcwhlavOSpoT5KicwE1bYD3jZp4nyR1xzojz1Y2fap4gtySwGrfXvLcK5j
         oxkBOSzDZRc8wM6wBrmr/9k4OWmpPGQSDD6Gv/QAkvAuAwhXEPzTSUXF/lUjoPi86f5G
         pJNYYt4258AHXFbnaBGjnD57ZAICOITfGEuFsfZ3iD24yDxGlAo/B9hygDr4t9sQeO/Q
         G5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892310; x=1795497110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFIGFgrqmh7vJ8p05TfgpCv8oubT+IqY4VjNLXb1IxQ=;
        b=MyFtlwcW9FPr/I6meFDb4oX661JYxg7KBYWhodt+UJbz7R3RgMhoB16tyX7zKErsq5
         GAolmHVNcIgORLK0eRR1U1z/jN7TVlD+HhZBA7ooSY717qvX17RlOSSmEHKJbEBZ7agl
         dJphUGOC23awlCx6wIHsBHuqPUS/xmAdQTIKPA8reReu8ZzZNowLQsD6BgTbLEnDargY
         id5qIthTbm5zitSNHuDNuQimMUkRBf8ZYfUQpY8KVFBxVxwK9J7ENsZBR8ooe9Cx/Knp
         HaCNJiUlIvOXMW8y9jicfOwT0KlfALrZVAhsD8mlqRmHeXF0reMV6/uBrCxACV8hzZcD
         I4bw==
X-Forwarded-Encrypted: i=1; AL+hErHYO52VXR1X9QT2wMBRUStxY6VjXNlkl5OzFeT/OYK/jjc00soXNMBwJqm0XKFs395Zvm4xxG0mSsvVZg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8+Fcq8R+hjcYHT52IsL9Jg0MVzvck86GXxiQj0VpRZWNYdYdw6
	jtStrP+IVnXGLfH9mBkKPidojUMpXA+Z6NKZ+apOqjGpcqzH1h90z5kPfs8uP0xy6uY=
X-Gm-Gg: AYBFou3y/SrKbQyfTbYXiDmkYdRHhx4fymkbc68eaypEB2dLv0xNtQKt2ZsYIrxbR8u
	Rax8WYfqUm3Wwb28VK9DF7FmcVW/QSTly3cysr6bFJbwLsA+uIyl7Cw1TqEmBwg6nht+zxc9t2M
	TjIslntwvgw2LyFIMIjdLZhIZTEzIlYjJXegMJPfW4lPa8DcStF5X0zZX1lgs8rnsBzbImFK711
	s7KlQ+CTPl6SiC5afpX2GziaQOrfkIxnsbaLGRc+1z64eSo4iHKtZztFm4rFsmEwvtl7HpQRkWF
	AoOzFz8tc8KXHFRMKmmQTy38cezzYZ+7THZ04iM9eWGv/0qjOVp8QMP2bC43gmWV8qtk74IwdkS
	CyhIhflRGkS1OkWxEs7obnzBW4Qa0v5wkBTjyKgsAuAydb3URFqRDGWXdo43vlqAoZJuFYL/yun
	kOhj/M2g5JQQ3TOxji+DJ8HY1TEFEHnMIU0ZbjIKfH5GcPf+nLLWWPZ5F9sFoAsfrWSG3BaHrfR
	FDbx5P0uj6XjepGHrGAuphmZ9/VqYFP1RKY+pgK1mlw8sDvH8jf9xdTRwBje/xxUWs4bWLmuLbh
	YSxpdkqR+Ig7981m2MkGqmyJipfliw==
X-Received: by 2002:a05:701a:cc87:20b0:1b5:3878:aa29 with SMTP id a92af1059eb24-1b53878b8c1mr2057482c88.38.1794892309617;
        Mon, 16 Nov 2026 21:11:49 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm53754284c88.9.2026.11.16.21.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:11:48 -0800 (PST)
Date: Tue, 17 Nov 2026 10:41:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rajanyadav0307@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] cpufreq: sun50i: Handle boards with the
 allwinner,sun50i-a133 compatible
Message-ID: <avviEW1-h495D0B5@vireshk-B250M-D3H>
References: <20261104-a133-fix-v1-1-d0b5ad3d4c5d@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-a133-fix-v1-1-d0b5ad3d4c5d@gmail.com>

On 04-11-26, 22:07, Rajan Yadav via B4 Relay wrote:
> From: Rajan Yadav <rajanyadav0307@gmail.com>
> 
> The Teclast P80 uses "allwinner,sun50i-a133" as its only SoC
> compatible, as documented in the arm/sunxi.yaml binding. Neither the
> sun50i cpufreq driver nor the cpufreq-dt-platdev blocklist lists it.
> cpufreq-dt then probes on its own, finds only opp-microvolt-speedN
> properties and fails:
> 
>   cpu cpu0: opp_parse_microvolt: opp-microvolt missing although OPP managing regulators
>   cpu cpu0: _of_add_opp_table_v2: Failed to add OPP, -22
>   cpu cpu0: OPP table can't be empty
> 
> so the board runs without CPU frequency scaling.
> 
> Add the compatible to both lists.
> 
> Tested on a KickPi K5C (A133) with its root compatible changed to
> "allwinner,sun50i-a133" only: on v7.4-rc1 cpufreq fails as above, with
> this change the sun50i driver probes and the A100 speed1 OPPs are used.
> v6.18 fails the same way, also with "kickpi,k5c" listed first.
> 
> Claude Code (Anthropic) drafted this change and its message from my test
> logs; I reviewed and tested it.
> 
> Fixes: 60b064eb82e6 ("arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet")
> Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
> ---
> This fixes the Teclast P80 support added in v7.4-rc1, so I think it can
> go in as a fix for 7.4. I do not have a Teclast P80; I reproduced the
> failure on a KickPi K5C as described above. A series with A133 speed
> grade support, which Andre asked for, follows separately.
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c   | 1 +
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index bce4c87573a..6bdeba47749 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -110,6 +110,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "airoha,en7581", },
>  
>  	{ .compatible = "allwinner,sun50i-a100" },
> +	{ .compatible = "allwinner,sun50i-a133", },
>  	{ .compatible = "allwinner,sun50i-h6", },
>  	{ .compatible = "allwinner,sun50i-h616", },
>  	{ .compatible = "allwinner,sun50i-h618", },
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index 9261d148a16..5d4ff192e99 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -324,6 +324,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
>  static const struct of_device_id sun50i_cpufreq_match_list[] = {
>  	{ .compatible = "allwinner,sun50i-h6" },
>  	{ .compatible = "allwinner,sun50i-a100" },
> +	{ .compatible = "allwinner,sun50i-a133" },
>  	{ .compatible = "allwinner,sun50i-h616" },
>  	{ .compatible = "allwinner,sun50i-h618" },
>  	{ .compatible = "allwinner,sun50i-h700" },
> 

Applied. Thanks.

-- 
viresh
