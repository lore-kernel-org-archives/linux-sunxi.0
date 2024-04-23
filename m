Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C88EFC18
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Apr 2024 01:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713836318; cv=none; b=tUZ42HMX4qWJHwYxsvfmbXOx2jAQZBDSnq+uLIVlzpcgZc8oHZo2W36lqD2xlh3PzihCG73eSBXmQAkqVumMo2hvw2ZLPg5TSBHzGBgVeSYQvvQ+gUQWk1JYe77zyjCAktBItQiPbSX2t73/9C4YrSwnfpcuCOOU4YHtqpFkiow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713836318; c=relaxed/simple;
	bh=C7wCWBdC6TfEVr3TjcsdkpMwWzcgG7xcQ19WyXxt6JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGBJtE0PcpVVNRAh/6GIuE8NxOB4w7AbytAgdMqLPpIIluz+jkPyp93GpnsXOb8JiQ0Vh0h216MT2X6FFh2nWVLnLJS49cIVQg/WLScH8J5kqxgFIZWF2byG0V9wkFFJ+3sSHFWXI6S57igj/dKE5/inRZr75Dq2PRR+tFJ9jIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cz7dppGG; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cz7dppGG"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5ac8c73cf88so3301662eaf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 18:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713836315; x=1714441115; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rtki28GfeCNBbS4WQvcAXIspTIGgU1gSHxdtSjsBoQ=;
        b=cz7dppGGErf+RObqU3nbsItvQMUCJ6BmHSBKMisGK0vny0fHextQnMTSL10+Iw5H6w
         lfodLSSr6wkuSXV6oTlkXXX4tJA/SX5dr0zPHML7d4nKAWkS0gO/S1eWxEwzWSnNxoKg
         BB917I9/nFVlfRACgS31dYOIJkEY27Lh8H+V9NoQbZiA3tk5Dm5SX81VBD70a6ccdnP5
         tJSADgZsayStTG8uFz92zrdo7JaEU0Z1M9XeoLkG59IlSwv6bdSHOg3g630mrEWfXEVO
         ppK/krCtuGYVqpo9Y3bGO4k/V7viqNscuvG2U33Wbl6OpvdglPkeQcgjcodwJ3WNidM8
         cpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713836315; x=1714441115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rtki28GfeCNBbS4WQvcAXIspTIGgU1gSHxdtSjsBoQ=;
        b=v/+4ONqAWmV4tgpzXtK2oN72RkW9ek5cg3BMPb5PTX8kg9PODBRTSyXBst2q9sXAAF
         iQcbRikwZR19SH7aKTbwDe/RvGGoRvW/TFrIAb6AG57cSXsikjTt6XQ8VjBmwh/kgvMT
         XYkyLg8e1hxaRkj+rYPuoeAqiYnk1IZA3a4DBwa4hu6onmJyOySc8SSY3fInSgb9yqxS
         GgI4E0sgwPFAlej1n7qnW9iJl28sr1Tdk+WPvBUh+nd91oS9JpdUzXDKsdoq1mTPhrao
         TYJWnfyqur+vXb5y5mB3hR6XDmg3ZcP2GgvqiMpsJq6daBkfoaIVG/nioVP1MNmHiwkn
         CeqA==
X-Forwarded-Encrypted: i=1; AJvYcCXnKYpYj9+2MPO+6JL1yxdYkIqrFj5pW1aHuRqkwjirhyqRTNH7Uo/tmZOE2ZNsiGmmDitDfNAsClZbVqCNd3hztDayPAp5x7wucsU=
X-Gm-Message-State: AOJu0Yw0UV3AyFwssqzeXXj56oZDlcu5yZ0RZpHywPya+UuFDbQidf1w
	c3ZjBUqVQfkM+MPTOB9qMPI9pUfB0zZsbTkqEFZCPR5mam/owAGhGCOlhagDc6Z/U6PhDLq2xME
	CU8IFT9EKP3avVU5gIlXMxUYAEfE=
X-Google-Smtp-Source: AGHT+IG1zcBxOQ8bycSUmKLWA3VWv8PCkHeLT1dbvOXgXVbRhgdUjlCXa+0aqQsTbjhbjt6Hejy2UbCBtX5QmIR2nMk=
X-Received: by 2002:a05:6358:9792:b0:183:fb11:adeb with SMTP id
 f18-20020a056358979200b00183fb11adebmr15644866rwb.21.1713836315176; Mon, 22
 Apr 2024 18:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <285de20a187f3e4baeb28f639b5bf55e914a3821.1713756666.git.viresh.kumar@linaro.org>
In-Reply-To: <285de20a187f3e4baeb28f639b5bf55e914a3821.1713756666.git.viresh.kumar@linaro.org>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 23 Apr 2024 11:38:24 +1000
Message-ID: <CAGRGNgWHkVkOP13jh-w1KQYeR_yeq1JgOt9a+R40F8DGYKMtkg@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: sun50i: Fix build warning around snprint()
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, kernel test robot <lkp@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

On Mon, Apr 22, 2024 at 1:31=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> The Sun50i driver generates a warning with W=3D1:
>
> warning: '%d' directive output may be truncated writing between 1 and 10 =
bytes into a region of size 2 [-Wformat-truncation=3D]
>
> Fix it by allocating a big enough array to print an integer.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404191715.LDwMm2gP-lkp@i=
ntel.com/
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

This'll absolutely fix the issue here, so:

Reviewed-by: Julian Calaby <julian.calaby@gmail.com>

However:

> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun=
50i-cpufreq-nvmem.c
> index 30e5c337611c..cd50cea16a87 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -208,7 +206,7 @@ static int sun50i_cpufreq_get_efuse(void)
>  static int sun50i_cpufreq_nvmem_probe(struct platform_device *pdev)
>  {
>         int *opp_tokens;
> -       char name[MAX_NAME_LEN];
> +       char name[] =3D "speedXXXXXXXXXXX"; /* Integers can take 11 chars=
 max */

Would it make sense to just set a static length for the string here,
say 17-20 characters and add a comment explaining the number, say: /*
"speed" + 11 chars for the int */

The string constant, while it'll probably be optimised away, seems
weird and wasteful.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
